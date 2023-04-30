import 'package:firebase_auth/firebase_auth.dart';
import 'package:heyy_backend/src/models/email_signup_response.dart';

class AuthUsingEmail {
  static Future<EmailSignUpResponse> signUp(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return EmailSignUpResponse(message: 'User SignedUp Successfully', signUpSuccess: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return EmailSignUpResponse(message: 'The password provided is too weak.', signUpSuccess: false);
      } else if (e.code == 'email-already-in-use') {
        return EmailSignUpResponse(message: 'The account already exists for that email.', signUpSuccess: false);
      } else {
        return EmailSignUpResponse(message: 'Something went wrong', signUpSuccess: false);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<EmailSignUpResponse> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return EmailSignUpResponse(signUpSuccess: true, message: 'Logged-in Successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return EmailSignUpResponse(signUpSuccess: false, message: 'No user found for that email. Please signup');
      } else if (e.code == 'wrong-password') {
        return EmailSignUpResponse(signUpSuccess: false, message: 'Wrong password provided for that user.');
      } else {
        return EmailSignUpResponse(signUpSuccess: false, message: 'Something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }
}
