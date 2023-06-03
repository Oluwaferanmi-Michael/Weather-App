

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/enums/date_sorting.dart';
import 'package:insta_clone/state/comments/models/post_comment_requests.dart';
import 'package:insta_clone/state/posts/providers/can_current_user_delete_post_provider.dart';
import 'package:insta_clone/state/posts/providers/delete_post_provider.dart';
import 'package:insta_clone/state/posts/providers/specific_post_with_comments_provider.dart';
import 'package:insta_clone/views/components/comments/compact_comment_column.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_clone/views/components/dialogs/delete_dialog.dart';
import 'package:insta_clone/views/components/like_button.dart';
import 'package:insta_clone/views/components/likes_count_view.dart';
import 'package:insta_clone/views/components/post/post_date_view.dart';
import 'package:insta_clone/views/components/post/post_display_name_message.dart';
import 'package:insta_clone/views/post_comments/post_comments.dart';
import 'package:share_plus/share_plus.dart';

import '../../state/posts/models/post.dart';
import '../components/animations/small_error_anim.dart';
import '../components/post/post_image_or_video_view.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Post post;
  const PostDetailsView({super.key, required this.post});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostDetailsViewState();
}

class _PostDetailsViewState extends ConsumerState<PostDetailsView> {

  @override
  Widget build(BuildContext context) {

    final request = PostCommentRequest(postId: widget.post.postId, limit: 3, sortByCreatedAt: true, dateSorting: DateSorting.oldOnTop);
    final postWithComments = ref.watch(specificPostWithCommentProvider(request));

    final canDeletePost = ref.watch(canCurrentUserDeleteProvider(widget.post));

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.postDetails),
        actions: [
          
            postWithComments.when(
              data: (postWithComments) {
                return IconButton(
                  onPressed: () {
                    final uri =  postWithComments.post.fileUrl;
                    Share.share(uri, subject: Strings.checkOutThisPost);
                  }, 
                  icon: const Icon(Icons.share));
                }, error: (error, stacktrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator()),


            if (canDeletePost.value ?? false)
              IconButton(onPressed: () async {
                final shouldDelete = await const DeleteDialog(titleOfObjectToDelete: Strings.post).present(
                  context
                ).then((value) => value ?? false);

                if(shouldDelete){
                  ref.read(deletePostProvider.notifier).deletePost(post: widget.post);
                }

                if (mounted) {
                  Navigator.pop(context);
                }
              }, icon: const Icon(Icons.delete))
            
      
        ],
      ),

      body: postWithComments.when(
        data: (postWithComments) {
          final postId = postWithComments.post.postId;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostImageOrVideoView(post: postWithComments.post,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (postWithComments.post.allowLikes)
                    LikeButton(postId: postId),
                    
                    if(postWithComments.post.allowComments)
                    IconButton(
                      onPressed: () => Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => PostCommentsView(postId: postId),)), icon: const Icon(Icons.comment_outlined))
                  ],
                ),

                PostDisplayNameAndMessage(post: postWithComments.post),

                PostDateView(dateTime: postWithComments.post.createdAt),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(color: Colors.white70,),
                ),

                CompactCommentColumn(comments: postWithComments.comments),

                if (postWithComments.post.allowLikes)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        LikeCountView(post: postWithComments.post),
                      ],
                    ),
                  ),

                  const SizedBox.expand()
                
              ],
            ),
          );
        },
         error: (error, stacktrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator())
    );
  }
}