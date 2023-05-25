

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/post_settings/notifiers/post_settings_notifier.dart';

import '../models/post_setting.dart';

final postSettingProvider = StateNotifierProvider<PostSettingNotifier, Map<PostSetting, bool>>((ref) {
  return PostSettingNotifier();
});