import 'package:flutter/material.dart';
// import 'package:insta_clone/state/posts/models/post.dart';
import 'package:intl/intl.dart';

class PostDateView extends StatelessWidget {
  final DateTime dateTime;
  const PostDateView({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('d MMMM, yyyy, hh:mm a');
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        formater.format(
          dateTime,
        )
      ),
    );
  }
}