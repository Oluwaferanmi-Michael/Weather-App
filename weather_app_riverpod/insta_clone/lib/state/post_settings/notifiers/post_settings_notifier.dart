import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/post_setting.dart';

class PostSettingNotifier extends StateNotifier<Map<PostSetting, bool>> {

  PostSettingNotifier() : super(
    UnmodifiableMapView({
      for(final setting in PostSetting.values) setting:  true
    })
  );

  void setSettings({
    required PostSetting settings,
    required bool value,
  }) {
    final existingValue = state[settings];
    if(existingValue == null || existingValue == value){
      return;
    }
    state = Map.unmodifiable(
      Map.from(state)..[settings] = value,
    );
  }
  
}


