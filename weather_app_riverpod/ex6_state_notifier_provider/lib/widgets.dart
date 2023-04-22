import 'package:ex6_state_notifier_provider/ext.dart';
import 'package:ex6_state_notifier_provider/provider/fav_status_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
          value: ref.watch(favStatusProvider),
          items: FavoriteStatus.values.map(
            (fs) => DropdownMenuItem(
              value: fs,
              child: Text(fs.toString().split('.').last))).toList(),
            onChanged: (value) {
              ref.read(favStatusProvider.notifier).state = value!;
            },
            );
      } 
    );
  }
}