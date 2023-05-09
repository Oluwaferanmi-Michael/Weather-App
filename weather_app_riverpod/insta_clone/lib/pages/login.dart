import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:insta_clone/state/auth/providers/auth_state_provider.dart';



class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return TextButton(
                onPressed: () async {
                  await ref.watch(authStateProvider.notifier).loginWithGoogle();
                  },
                child: const Text('Sign in with Google')
              );
              }
              
            ),
      
            Consumer(
              builder: (context, ref, child) => 
              TextButton(
                onPressed: () async {
                  await ref.watch(authStateProvider.notifier).loginWithFacebook();
                   },
                child: const Text('Sign in with Facebook')
              ),
            )
          ],
        ),
      ),
    );
  }
}