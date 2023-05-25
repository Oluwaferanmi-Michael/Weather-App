import 'package:flutter/material.dart';
import 'package:insta_clone/views/components/animations/models/lottie_animation.dart';

import 'lottie_animation_view.dart';

class EmptyContentAnim extends LottieAnimationView {
  const EmptyContentAnim({super.key}) : super(animation: LottieAnimation.empty);
}


class EmptyContentWithText extends StatelessWidget {
  final String text;
  const EmptyContentWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),

          const EmptyContentAnim()

        ],
      ),
    );
  }
}