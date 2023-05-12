import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:insta_clone/state/auth/providers/auth_state_provider.dart';
import 'package:insta_clone/views/components/constants/app_colors.dart';
import 'package:insta_clone/views/login/auth_button.dart';
import 'package:insta_clone/views/login/divider.dart';
import 'package:insta_clone/views/login/login_view_links.dart';

import '../views/components/constants/strings.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.instantGram),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40,),

              Text(Strings.welcome, style: Theme.of(context).textTheme.displaySmall,),

              const DividerMargin(),

              Text(Strings.welcome, style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),),

              const SizedBox(height: 20,),

              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.loginButtonCOlor,
                  foregroundColor: AppColors.loginButtonTextColor
                ),
                onPressed: () async {
                  await ref.watch(authStateProvider.notifier).loginWithFacebook();
                  }, child: AuthButton(text: Strings.facebook, icon: FontAwesomeIcons.facebook, iconColor: AppColors.facebookColor)),

                  const SizedBox(height: 20,),
              
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.loginButtonCOlor,
                  foregroundColor: AppColors.loginButtonTextColor
                ),
                onPressed: () async {
                  await ref.watch(authStateProvider.notifier).loginWithGoogle();
                  }, child: AuthButton(text: Strings.google, icon: FontAwesomeIcons.google, iconColor: AppColors.googleColor)),

                  const DividerMargin(),

              const LoginViewSignUpLinks()
            ],
          )
        ),
      ),
    );
  }
}
