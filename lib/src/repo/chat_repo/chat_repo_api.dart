import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heyy_backend/src/repo/chat_repo/chat_repo.dart';

class ChatRepoApi implements ChatRepo {
  var instance = FirebaseFirestore.instance;
  @override
  Future<List<Map<String, dynamic>>> getConversations(String id) async {
    return (await instance.collection('users').doc(id).collection('conversations').orderBy('lastMessageTime').get())
        .docChanges
        .map((e) => e.doc.data() ?? {})
        .toList();
  }

  @override
  Future<void> addConversation(String id, Map<String, dynamic> data) async {
    await instance.collection('users').doc(id).collection('conversations').doc(data['id']).set(data);
  }

  @override
  Future<void> updateConversation(String id, Map<String, dynamic> data) async {
    await instance.collection('users').doc(id).collection('conversations').doc(data['id']).update(data);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedConversations(String id) {
    return instance.collection('users').doc(id).collection('conversations').orderBy('lastMessageTime').snapshots();
  }
}
