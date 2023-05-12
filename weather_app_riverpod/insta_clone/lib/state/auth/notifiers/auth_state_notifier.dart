
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/models/auth_results.dart';
import 'package:insta_clone/state/auth/backend/authenticator.dart';
import 'package:insta_clone/state/auth/models/auth_state.dart';
import 'package:insta_clone/state/user_info/backend/user_info_storage.dart';

import '../../posts/typedefs/user_id.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn){
    state = AuthState(result: AuthResult.success, isLoading: false, userId: _authenticator.userId);
    }
  }

  final _authenticator = const Authenticator();
  final _userInfoStroage = const UserInfoStorage();

  Future<void> logOut() async {
    state = state.copyWith(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;

    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthState(result: result, isLoading: false, userId: userId);
  }

  Future<void> loginWithFacebook() async {
    state = state.copyWith(true);
    final result = await _authenticator.logInWithFacebook();
    final userId = _authenticator.userId;

    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthState(result: result, isLoading: false, userId: userId);
  }

  Future<void> saveUserInfo({
      required UserId userId
    }) => 
    _userInfoStroage.saveUserInfo(userId: userId, displayName: _authenticator.displayName, email: _authenticator.email);
}




