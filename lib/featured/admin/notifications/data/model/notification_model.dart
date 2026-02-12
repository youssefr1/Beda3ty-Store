class NotificationModel {
  final String id;
  final String title;
  final String body;
  final String createdAt;
  final bool isRead;
  final String type; // 'admin' or 'user'

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
    required this.type,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      createdAt: json['createdAt']?.toString() ?? '',
      isRead: json['isRead'] == true,
      type: json['type']?.toString() ?? 'user',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'createdAt': createdAt,
      'isRead': isRead,
      'type': type,
    };
  }
}
