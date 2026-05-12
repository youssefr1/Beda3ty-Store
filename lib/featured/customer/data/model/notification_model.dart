import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationModel {
  NotificationModel({
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });

  factory NotificationModel.fromRemoteMessage(RemoteMessage message) {
    final notification = message.notification;
    return NotificationModel(
      title: notification?.title ?? 'No Title',
      body: notification?.body ?? 'No Body',
      timestamp: DateTime.now(),
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] as String,
      body: json['body'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'timestamp': timestamp.toIso8601String(),
        'isRead': isRead,
      };

  final String title;
  final String body;
  final DateTime timestamp;
  bool isRead;
}
