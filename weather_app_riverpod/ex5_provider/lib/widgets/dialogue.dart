import 'package:flutter/material.dart';

import '../models/people_model.dart';


final nameController = TextEditingController();
final ageController = TextEditingController();

Future<People?> createorUpdatePerson(
  BuildContext context,
  [People? existingPerson,]
){

  String? name = existingPerson?.name;
  int? age = existingPerson?.age;

  ageController.text = name ?? '';
  nameController.text = age?.toString() ?? '';

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Add a Person'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Person Name'
              ),
              controller: nameController,
              onChanged: (value) => name = value
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Person Age'
              ),
              controller: ageController,
              onChanged: (value) => age = int.tryParse(value)
            )
            ],),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop, child: const Text('CANCEL')),
          TextButton(onPressed: () {
            if (name != null && age != null){
              if(existingPerson != null){
                // have exisitng person
                final newPerson = existingPerson.updated(name, age);
                Navigator.of(context).pop(newPerson);
              } else {
                // no exisiting Person create a new one
              Navigator.of(context).pop(
                People(
                  name: name!,
                  age: age!
                )
              );
              }
            } else {
              // no exisiting Person create a new one
              Navigator.of(context).pop();
            }
          }, child: const Text('SAVE'))
        ],
      );
    });
}