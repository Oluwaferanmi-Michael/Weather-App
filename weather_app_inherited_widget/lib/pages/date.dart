import 'package:flutter/material.dart';

import '../mock/api_provider.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context).api;
    return SizedBox(
      child: Center(
        child: Text(api.date ?? 'tapp to fetch')
      ),
    );
  }
}
