import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepo {
  //conversations
  Future<List<Map<String, dynamic>>> getConversations(String id);
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedConversations(String id);
  Future<void> addConversation(String id, Map<String, dynamic> data);
  Future<void> updateConversation(String id, Map<String, dynamic> data);

  //chats
  //Future<void>
  Future<void> sendMessage(String chatId, Map<String, dynamic> data);
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedMessages(String id);
}
