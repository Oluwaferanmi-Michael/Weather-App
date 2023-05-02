import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insta_clone/state/constants/constants.dart';

import '../../../models/auth_results.dart';
import '../../posts/typedefs/user_id.dart';

class Authenticator{
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  bool get isAlreadyLoggedIn => userId != null;

  String get displayName => FirebaseAuth.instance.currentUser?.displayName ?? '';

  String? get email => FirebaseAuth.instance.currentUser?.email;

  const Authenticator();

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<AuthResult> logInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;

    if(token == null){
      return AuthResult.aborted;
    }

    final oAuthCredential = FacebookAuthProvider.credential(token);

    try {
      await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      return AuthResult.success;
    } on FirebaseAuthException catch (e) {
      final email = e.email;
      final credential = e.credential;

      if (e.code == Constants.accountExistsWithDifferentCredential && email != null && credential != null) {
        final providers = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

        if (providers.contains(Constants.google)) {
          await loginWithGoogle();
          FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        }
        return AuthResult.success;
      }

      return AuthResult.failure;
    }
  }

  Future<AuthResult> loginWithGoogle()  async {
    final googleSignIn = GoogleSignIn(scopes: [Constants.emailScope]);

    final signInAccount = await googleSignIn.signIn();

    if (signInAccount == null) {
      return AuthResult.aborted;
    }


    final googleAuth = await signInAccount.authentication;
    final authCredential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(authCredential);
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;  
    }
  }


}