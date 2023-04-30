import 'package:dio/dio.dart';
import 'package:firebase_backend/src/config/dio_setup.dart';
import 'package:firebase_backend/src/models/notification_response.dart';
import 'package:firebase_backend/src/notifications/notification_repo.dart';

class NotificationRepositoryImpl extends NotificationRepositiory {
  const NotificationRepositoryImpl();

  @override
  Future<void> sendMessagePushNotification(NotificationResponse notification, String apiKey) async {
    FirebaseDio dio = FirebaseDio(key: apiKey);
    await dio.create().post(
          'https://fcm.googleapis.com/fcm/send',
          data: NotificationResponse.notificationToRequestJson(notification),
        );
  }

  @override
  Future<void> configureFCMPushNotification() async {}
}
