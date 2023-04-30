import 'package:firebase_auth/firebase_auth.dart';

class AuthUsingPhone {
  static Future<String?> login(String phoneNumber, {int? timeoutInSeconds}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    bool verificationStatus = true;
    String verificationId = '';
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        verificationStatus = true;
      },
      codeSent: (String id, int? resendToken) {
        verificationId = id;
      },
      codeAutoRetrievalTimeout: (String id) {
        verificationId = id;
      },
      timeout: Duration(seconds: timeoutInSeconds ?? 60),
    );
    return verificationStatus ? verificationId : null;
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
