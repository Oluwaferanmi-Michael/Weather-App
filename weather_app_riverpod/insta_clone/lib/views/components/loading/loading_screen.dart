import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_clone/views/components/loading/loading_controller.dart';

import '../constants/strings.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();

  factory LoadingScreen.instance() => _shared;


  LoadingScreenController? controller;

  void show({required BuildContext context, String text = Strings.loading}){
    if (controller?.update(text) ?? false) {
      return ;
    } else {
      controller = showOverlay(context: context, text: text);
    }
  }

  void hide(){
    controller?.close();
    controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String text
  }){

    final state = Overlay.of(context);
    // ignore: unnecessary_null_comparison
    if(state == null){
      return null;
    }

    final textController = StreamController<String>();
    textController.add(text);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * .8,
              maxHeight: size.height * .8,
              minWidth: size.width * .5 
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox( height: 10),
                    const CircularProgressIndicator(),
                    const SizedBox( height: 10),

                    StreamBuilder<String>(
                      stream: textController.stream,
                      builder: (context, snapshot){
                        if (snapshot.hasData) {
                          return Text(snapshot.requireData, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.black),);
                        } else {
                          return const SizedBox();
                        }
                      })
                  ],
                ), 
              ),
            )
          ),
        ),
      ),
    );

    state.insert(overlay);

    return LoadingScreenController(close: () {
      textController.close();
      overlay.remove();
      return true;
    }, update: (text) {
      textController.add(text);
      return true;
    });
  }


}