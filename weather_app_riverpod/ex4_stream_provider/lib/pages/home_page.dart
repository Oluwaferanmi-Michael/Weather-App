import 'package:ex4_stream_provider/providers/stream_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);
    return Scaffold(

      body: names.when(
        data: (names)  {
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(names.elementAt(index)),
            );
          });
        },
        error: (error, stackTrace) => const Text('End of list'), 
        loading: () => const Center(child: CircularProgressIndicator.adaptive())),
    );
  }
}

List<String> names = ['Alice', 'Bob', 'Charlie', 'David'];