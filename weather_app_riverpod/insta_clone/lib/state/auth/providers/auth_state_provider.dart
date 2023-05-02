import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/auth/notifiers/auth_state_notifier.dart';

import '../models/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((_) {
  return AuthStateNotifier();
});

