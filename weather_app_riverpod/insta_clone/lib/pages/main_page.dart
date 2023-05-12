import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/views/components/animations/data_not_found_anim.dart';

import '../state/auth/providers/auth_state_provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('LoggedIn'),
          Consumer(
            builder: (context, ref, child) => DataNotFoundAnim()
            // TextButton(onPressed: () async =>
            //   await ref.read(authStateProvider.notifier).logOut()
            //   ,child: const Text('LogOut')
            //   )
            )
        ],
      ),)
    );
  }
}