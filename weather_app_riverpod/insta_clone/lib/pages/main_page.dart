import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/image_upload/helper/image_picker_helper.dart';
import 'package:insta_clone/state/image_upload/helper/image_picker_permission_helper.dart';
import 'package:insta_clone/state/post_settings/provider/post_settings_provider.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_clone/views/components/dialogs/log_out_dialog.dart';
import 'package:insta_clone/views/create_new_post/create_new_post_view.dart';
import 'package:insta_clone/views/tabs/search_view.dart';
import 'package:insta_clone/views/tabs/user_posts/user_posts_view.dart';
import 'package:permission_handler/permission_handler.dart';
import '../state/auth/providers/auth_state_provider.dart';
import '../state/image_upload/models/file_type.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.instantGram),
          actions: [

            IconButton(
              onPressed: () async {
                final imagePermission = await AccessPermissions.requestImageAccessPermision();
                if (imagePermission == PermissionStatus.denied) {
                  return;
                }

                final videoFile = await ImagePickerHelper.pickVideoFromGallery();
                if (videoFile == null) {
                  return;
                } 

                ref.invalidate(postSettingProvider);
                
                // go to screen to post
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return CreateNewPostView(fileToPost: videoFile, fileType: FileType.video);
                }));
              },
              icon: const FaIcon(FontAwesomeIcons.film)
            ),

            IconButton(
              onPressed: () async {
                final imageFile = await ImagePickerHelper.pickImageFromGallery();
                if (imageFile == null) {
                  return;
                } 
                ref.invalidate(postSettingProvider);
                // got to Screen to post
                if (!mounted) {
                  return;
                }
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return CreateNewPostView(fileToPost: imageFile, fileType: FileType.image);
                }));
              },
              icon: const Icon(Icons.add_photo_alternate)
            ),

            IconButton(
              onPressed: () async {
                final shouldLogOut = await LogOutDialog().present(context).then((value) => value ?? false);
                if (shouldLogOut) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(Icons.logout)
            )
          ],

          bottom: const TabBar(
            tabs: [
              Tab(child: Icon(Icons.person)),
              Tab(child: Icon(Icons.search)),
              Tab(child: Icon(Icons.home)),
            ]),
        ),

        body: const TabBarView(children: [
          UserPostsView(),
          SearchView(),
          UserPostsView(),
        ])
      ));
  }
}