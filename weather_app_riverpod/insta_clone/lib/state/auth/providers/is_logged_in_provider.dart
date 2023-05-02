  import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/models/auth_results.dart';

import 'auth_state_provider.dart';

final isLoggedInProvider = Provider((ref) {

  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});