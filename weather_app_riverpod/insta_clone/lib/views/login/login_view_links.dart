import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/rich_text/base_text.dart';
import 'package:insta_clone/views/components/rich_text/rich_text_widget.dart';

class LoginViewSignUpLinks extends StatelessWidget {
  const LoginViewSignUpLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)
      ,
      texts: [
        BaseText.plainText(text: Strings.dontHaveAccount),
        BaseText.plainText(text: Strings.signUpOn),
        BaseText.linkText(text: Strings.facebook, onPressed: () {
          launchUrl(Uri.parse(
            Strings.facebookSignUpUrl
          ));
          }),
        BaseText.plainText(text: Strings.createAnAccount),
        BaseText.linkText(text: Strings.google, onPressed: () {
          launchUrl(Uri.parse(
            Strings.googleSignUpUrl
          ));})
        ],
    );
  }
}