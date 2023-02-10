import 'package:flutter/material.dart';
import 'package:weather_app/models/location_book.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../models/location_model.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final locations = LocationBook();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF131313),
        // ValueListenableBuilder reads what values have been changed through which value its listening to in this case...it is a list of Locations
        body: ValueListenableBuilder(
          valueListenable: LocationBook(),
          builder: (context, value, child) {
            final locations = value;
            return ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return Dismissible(
                    key: ValueKey(location.id),
                    onDismissed: (direction) {
                      LocationBook().remove(location: location);
                    },
                    child: Center(
                      child: ListTile(
                        minLeadingWidth: MediaQuery.of(context).size.width / 2,
                        // contentPadding: const EdgeInsets.symmetric(
                        //     vertical: 8, horizontal: 12),
                        title: Text(
                          location.name,
                          style: GoogleFonts.spaceGrotesk(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
