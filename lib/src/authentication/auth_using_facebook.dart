import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthUsingFacebook {
  static Future<void> login() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FacebookAuth _facebookAuth = FacebookAuth.instance;

    // Attempt to sign in with Facebook
    LoginResult result = await _facebookAuth.login();
    AccessToken accessToken = result.accessToken!;
    AuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
    UserCredential userCredential = await _auth.signInWithCredential(credential);
  }
}
