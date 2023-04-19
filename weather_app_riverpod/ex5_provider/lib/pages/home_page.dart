import 'package:ex5_provider/widgets/dialogue.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/change_notifier_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),

      body: Consumer(
        builder:(context, ref, child) {
          final listNotifier = ref.watch(peopleProvider);
          return ListView.builder(
          itemCount: listNotifier.count,
          itemBuilder: (context, index) {
            final people = listNotifier.people[index];
            return GestureDetector(
              onTap: () async {
                final updatedPerson = await createorUpdatePerson(context, people);
                if (updatedPerson != null) {
                  listNotifier.update(updatedPerson);
                }
              },
              child: ListTile(
                title: Text(people.displayName),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => listNotifier.remove(people)),),
            );
          },
        );},
      ),

      floatingActionButton: FloatingActionButton(onPressed: () async {
        final person = await createorUpdatePerson(context);
        if (person != null) {
          final listNotifier = ref.read(peopleProvider);
          listNotifier.addPerson(person);
        }
        },
      child: const Icon(Icons.add)),
    );
  }
}