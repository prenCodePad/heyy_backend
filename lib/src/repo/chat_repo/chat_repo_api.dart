import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heyy_backend/heyy_backend.dart';
import 'package:heyy_backend/src/repo/chat_repo/chat_repo.dart';

class ChatRepoApi implements ChatRepo {
  var instance = FirebaseFirestore.instance;
  @override
  Future<List<Map<String, dynamic>>> getConversations(String id) async {
    return (await instance
            .collection('users')
            .doc(id)
            .collection('conversations')
            .orderBy('lastMessageTime', descending: true)
            .get())
        .docChanges
        .map((e) => e.doc.data() ?? {})
        .toList();
  }

  @override
  Future<void> addConversation(String id, Map<String, dynamic> data) async {
    await instance
        .collection('users')
        .doc(id)
        .collection('conversations')
        .doc(Common.getChatId(id, data['id']))
        .set(data);
  }

  @override
  Future<void> updateConversation(String id, Map<String, dynamic> data) async {
    await instance.collection('users').doc(id).collection('conversations').doc(data['id']).update(data);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedConversations(String id) {
    return instance
        .collection('users')
        .doc(id)
        .collection('conversations')
        .orderBy('lastMessageTime', descending: true)
        .snapshots();
  }

  @override
  Future<void> sendMessage(String chatId, Map<String, dynamic> data) async {
    await instance.collection('chats').doc(chatId).collection('messages').doc(data['id']).set(data);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedMessages(String id) {
    return instance.collection('chats').doc(id).collection('messages').orderBy('time', descending: true).snapshots();
  }
}
