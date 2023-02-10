import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/location_book.dart';
import 'package:weather_app/models/location_model.dart';

import 'history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                controller: _controller,
                style:
                    GoogleFonts.spaceGrotesk(fontSize: 24, color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Start Typing',
                  hintStyle: GoogleFonts.spaceGrotesk(
                      fontSize: 24, color: Colors.white24),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    final location = Location(name: _controller.text);
                    _controller.clear();
                    LocationBook().add(location: location);
                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HistoryPage()));
                  },
                  child: const Text('search'))
            ],
          )),
    );
  }
}
