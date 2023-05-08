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

  @override
  Future<List<Map<String, dynamic>>> searchUser(String searchPhone) async {
    return (await firestore.collection('users').get())
        .docChanges
        .where((e) {
          var data = e.doc.data() ?? {};
          return data['phone'].toString().trim().contains(searchPhone);
        })
        .map((e) => e.doc.data()!)
        .toList();
  }

  @override
  Future<Map<String, dynamic>> getUserWithPhone(String phone) async {
    List<DocumentChange<Map<String, dynamic>>> docs =
        (await firestore.collection('users').where('phone', isEqualTo: phone).get()).docChanges;
    return docs.isEmpty ? {} : docs.first.doc.data() ?? {};
  }
}
