class NotificationResponse {
  final String title;
  final String body;
  final String to;
  final String senderId;
  final String recieverId;
  final String priority;
  final Map<String, dynamic>? data;

  NotificationResponse(
      {this.title = '',
      this.body = '',
      required this.to,
      this.data,
      this.senderId = '',
      this.recieverId = '',
      this.priority = 'high'});

  static Map<String, dynamic> notificationToRequestJson(NotificationResponse notification) {
    return {
      'data': notification.data,
      'notification': {
        'title': notification.title,
        'body': notification.body,
      },
      'priority': notification.priority,
      "content_available": true,
      'to': '/topics/${notification.recieverId}'
    };
  }
}
