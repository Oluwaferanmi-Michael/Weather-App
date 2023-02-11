import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'class_api.dart';

class ApiProvider extends InheritedWidget{
  final Api api;
  final String uuid;
  final Widget child;

  ApiProvider({
    Key? key,
    required this.api,
    required this.child
    }) : uuid = const Uuid().v4(), super(key: key, child: child);
    
      @override
      bool updateShouldNotify(covariant ApiProvider oldWidget) {
        return uuid != oldWidget.uuid ;
      }

      static ApiProvider of(BuildContext context){
        return context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
      }
}
