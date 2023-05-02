import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/ext.dart';


import 'package:insta_clone/state/auth/backend/authenticator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final result = Authenticator().loginWithGoogle();
              result.log();},
            child: const Text('Sign in with Google')
          ),

          TextButton(
            onPressed: () async {
              final result = Authenticator().logInWithFacebook();
              result.log();},
            child: const Text('Sign in with Facebook')
          )
        ],
      ),
    );
  }
}
