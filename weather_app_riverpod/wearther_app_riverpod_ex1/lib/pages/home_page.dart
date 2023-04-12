import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/dateProvider_1stex.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(date.day.toString()),
      ),

      body: Container(

      ),
    );
  }
}