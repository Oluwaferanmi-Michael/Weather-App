import 'package:flutter/material.dart';
import 'package:weather_app/models/location_book.dart';



class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final locations = LocationBook();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: LocationBook(),
        builder: (context, value, child){
          return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index)  {
            final location = locations.location(index: index)!;
            return Dismissible(
              
              child: ListTile(
                 title: Text(location.name),
              ),
            );
          }
          );
        },
      )
    );
  }
}
