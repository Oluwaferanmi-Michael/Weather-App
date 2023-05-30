import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/auth/providers/is_logged_in_provider.dart';
import 'package:insta_clone/views/components/loading/loading_screen.dart';

import '../state/providers/is_loading_provider.dart';
import 'login.dart';
import 'main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {

        // take care of displaying loading screen
        ref.listen(isLoadingProvider, (_, isLoading) {
          if(isLoading) {
            LoadingScreen.instance().show(context: context, text: 'Loading');
          } else {
            LoadingScreen.instance().hide();
          }
        },);
        
        final isLoggedIn = ref.watch(isLoggedInProvider);
        if (isLoggedIn){
          return const MainView();
        }
        else {
          return const LoginView();
        }
      },
    );
  }
}

