import 'package:firebase_backend/src/models/notification_response.dart';

abstract class NotificationRepositiory {
  const NotificationRepositiory();
  Future<void> sendMessagePushNotification(NotificationResponse notification, String apiKey);
  Future<void> configureFCMPushNotification();
}
