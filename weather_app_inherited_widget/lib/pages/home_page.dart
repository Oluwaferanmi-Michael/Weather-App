import 'package:flutter/material.dart';

import '../mock/api_provider.dart';
import 'date.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueKey _textKey = ValueKey<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(ApiProvider.of(context).api.date ?? ''),
        ),
        body: GestureDetector(
          onTap: () async {
            final api = ApiProvider.of(context).api;
            final time = await api.getDate();
            setState(() {
              _textKey = ValueKey(time);
            });
          },
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                DateWidget(
                  key: _textKey,
                ),
                TextButton(
                    onPressed: () => ApiProvider.of(context).api.call(),
                    child: const Text('call'))
              ],
            ),
          ),
        ));
  }
}
