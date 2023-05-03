import 'package:firebase_auth/firebase_auth.dart';

class AuthUsingPhone {
  static Future<void> login(String phoneNumber,
      {int? timeoutInSeconds,
      void Function(String, int?)? codeSent,
      void Function(String)? codeAutoRetrievalTimeout}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: codeSent ?? (String id, int? resendToken) {},
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout ?? (String id) {},
      timeout: Duration(seconds: timeoutInSeconds ?? 60),
    );
  }

  static Future<bool> verify(String verificationId, String smsCode) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'invalid-verification-code') {
        return false;
      } else {
        rethrow;
      }
    }
  }
}
