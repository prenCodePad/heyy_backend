import 'package:heyy_backend/heyy_backend.dart';

abstract class LoginRepo {
  Future<void> setUser(String id, Map<String, dynamic> userData);
  Future<void> updateUser(String id, Map<String, dynamic> userData);
  Future<Map<String, dynamic>> getUser(String id);
  Future<Map<String, dynamic>> getUserWithPhone(String id);
  Future<void> deleteUser(String id);
  Future<List<Map<String, dynamic>>> searchUser(String searchPhone);
}
