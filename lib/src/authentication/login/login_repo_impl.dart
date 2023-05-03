import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heyy_backend/src/authentication/login/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> setUser(String id, Map<String, dynamic> userData) async {
    await firestore.collection('users').doc(id).set(userData);
  }

  @override
  Future<void> updateUser(String id, Map<String, dynamic> userData) async {
    await firestore.collection('users').doc(id).update(userData);
  }

  @override
  Future<Map<String, dynamic>> getUser(String id) async {
    return (await firestore.collection('users').doc(id).get()).data() ?? {};
  }

  @override
  Future<void> deleteUser(String id) async {
    await firestore.collection('users').doc(id).delete();
  }
}
