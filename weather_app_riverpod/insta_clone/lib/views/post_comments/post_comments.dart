import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/state/auth/providers/user_id_provider.dart';
import 'package:insta_clone/state/comments/models/post_comment_requests.dart';
import 'package:insta_clone/state/comments/providers/post_comments_provider.dart';
import 'package:insta_clone/state/comments/providers/send_comments_provider.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';
import 'package:insta_clone/views/components/animations/empty_content_anim.dart';
import 'package:insta_clone/views/components/animations/error_anim.dart';
import 'package:insta_clone/views/components/animations/loading_anim.dart';
import 'package:insta_clone/views/components/comments/comment_tile.dart';
import 'package:insta_clone/views/extensions/dismiss_keyboard.dart';

import '../components/constants/strings.dart';



class PostCommentsView extends HookConsumerWidget {

  final PostId postId;

  const PostCommentsView({super.key, required this.postId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final commentsController = useTextEditingController();

    final hasText = useState(false);

    final request = useState(
      PostCommentRequest(postId: postId)
    );

    final comments = ref.watch(postCommentsProvider(request.value));

    useEffect(() {
      commentsController.addListener(() {
        hasText.value = commentsController.text.isNotEmpty;
      });
      return ;
    }, [commentsController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.comments),
        actions: [
          IconButton(
            onPressed: hasText.value == true ? () {
              submitCommentWithController(commentsController, ref);
            } : null, icon: const Icon(Icons.send))
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
            children: [
              Expanded(
                child: comments.when(
                  data: (comments) {

                    if (comments.isEmpty) {
                      return const SingleChildScrollView(
                        child: EmptyContentWithText(
                          text: Strings.noComments,
                        ),
                      );
                    }
                    return RefreshIndicator.adaptive(
                      onRefresh: () {
                        ref.invalidate(postCommentsProvider(request.value));
                        return Future.delayed(const Duration(seconds: 1));
                      },
                      child: ListView.builder(
                        itemCount: comments.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          final comment = comments.elementAt(index);
                          return CommentTile(comment: comment);
                          
                        }),
                    );},
                  
                  error: (context, snapshot) {
                    return const ErrorAnim();
                    },
                  loading: () => const LoadinAnim())
              ),


              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: commentsController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (comment) {
                        if (comment.isNotEmpty) {
                          submitCommentWithController(commentsController, ref);
                        }
                      },

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: Strings.writeHere
                      ),
                    ),
                  ),
                ),
              ) 
            ],
          ),
      ),
    );
  }


  Future<void> submitCommentWithController(TextEditingController controller, WidgetRef ref) async {
    final userId = ref.read(userIdProvider);

    if (userId == null) {
      return;
    }

    final isSent = await ref.read(sendCommentProvider.notifier).sendComment(
      fromUserId: userId, fromPostId: postId, comment: controller.text
    );

    if (isSent) {
      controller.clear();
      dismissKeyBoard();
    }
  }
}