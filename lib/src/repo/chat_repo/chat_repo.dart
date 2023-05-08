import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepo {
  Future<List<Map<String, dynamic>>> getConversations(String id);
  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamedConversations(String id);
  Future<void> addConversation(String id, Map<String, dynamic> data);
  Future<void> updateConversation(String id, Map<String, dynamic> data);
}
