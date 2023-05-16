import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_clone/views/components/dialogs/log_out_dialog.dart';
import 'package:insta_clone/views/tabs/user_posts/user_posts_view.dart';
import '../state/auth/providers/auth_state_provider.dart';

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
              onPressed: () async {},
              icon: const FaIcon(FontAwesomeIcons.fill)
            ),
            IconButton(
              onPressed: () {},
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
              Icon(Icons.person),
              Icon(Icons.search),
              Icon(Icons.home),
            ]),
        ),

        body: TabBarView(children: [
          UserPostsView(),
          UserPostsView(),
          UserPostsView(),
        ])
      ));
  }
}