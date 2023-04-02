import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_hooks/ext.dart' as ext;
import 'package:weather_app_flutter_hooks/reduxpatternhook/state_class.dart' as s;


class ReducerHook extends HookWidget {
  const ReducerHook({super.key});

  @override
  Widget build(BuildContext context) {
    final store = useReducer<s.State, ext.Action?>(s.reducer, initialState: const s.State.zero(), initialAction: null);

    const url = 'https://images.unsplash.com/photo-1569817480240-41de5e7283c9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';
    return Scaffold(
      body: Column(
        children: [

          Row(children: [
            RotateLeftButton(store: store),
            RotateRightButton(store: store),
            DecreaseAlphaButton(store: store),
            IncreaseAlphaButton(store: store),
          ],),

          const SizedBox(height: 200.0,),

          Opacity(
            opacity: store.state.alpha,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(store.state.rotationDegrees / 360),
              child: Center(child: Image.network(url, height: 300, fit: BoxFit.scaleDown,),)),
          ),
        ],
      ),
    );
  }
}

class IncreaseAlphaButton extends StatelessWidget {
  const IncreaseAlphaButton({
    super.key,
    required this.store,
  });

  final Store<s.State, ext.Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      store.dispatch(ext.Action.moreVisible);
    }, child: const Text('+Alpha'));
  }
}

class DecreaseAlphaButton extends StatelessWidget {
  const DecreaseAlphaButton({
    super.key,
    required this.store,
  });

  final Store<s.State, ext.Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      store.dispatch(ext.Action.lessVisible);
    }, child: const Text('-Alpha'));
  }
}

class RotateRightButton extends StatelessWidget {
  const RotateRightButton({
    super.key,
    required this.store,
  });

  final Store<s.State, ext.Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      store.dispatch(ext.Action.rotateRight);
    }, child: const Text('RotateRight'));
  }
}

class RotateLeftButton extends StatelessWidget {
  const RotateLeftButton({
    super.key,
    required this.store,
  });

  final Store<s.State, ext.Action?> store;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      store.dispatch(ext.Action.rotateLeft);
    }, child: const Text('RotateLeft'));
  }
}