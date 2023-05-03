import 'package:heyy_backend/heyy_backend.dart';

abstract class LoginRepo {
  Future<void> setUser(String id, Map<String, dynamic> userData);
  Future<void> updateUser(String id, Map<String, dynamic> userData);
  Future<Map<String, dynamic>> getUser(String id);
  Future<void> deleteUser(String id);
}
