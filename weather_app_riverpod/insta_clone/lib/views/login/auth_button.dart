import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';


class AuthButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  
  const AuthButton({super.key, required this.text, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(children: [
        FaIcon(icon,
        color: iconColor),

        const SizedBox(width: 10,),

        Text(text)
      ],),
    );
  }
}