import 'package:dio/dio.dart';
import '../model/notification_model.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<bool> createNotification({required String title, required String body, required String type});
  Future<bool> deleteNotification(String id);
}

class NotificationDataSourceImpl implements NotificationDataSource {
  final Dio dio;
  final String endPoint;

  NotificationDataSourceImpl({
    required this.dio,
    required this.endPoint,
  });

  @override
  Future<List<NotificationModel>> getNotifications() async {
    // Mock query - replace with actual GraphQL query
    const query = r'''
      query {
        notifications {
          id
          title
          body
          createdAt
          isRead
          type
        }
      }
    ''';

    try {
      // For now, we might not have a real endpoint, so we can mock or try to call it.
      // Assuming the endpoint exists or we handle the error.
      // If no endpoint, I'll return a mock list for UI testing if the call fails.
      
      final response = await dio.post(
        endPoint,
        data: {"query": query},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.data['data'] == null) {
        // Return mock data for testing
        return _getMockNotifications();
      }

      final List<dynamic> data = response.data['data']['notifications'] as List<dynamic>;

      return data
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching notifications: $e");
      // Return mock data for testing
      return _getMockNotifications();
    }
  }

  List<NotificationModel> _getMockNotifications() {
    return [
      NotificationModel(
        id: '1',
        title: 'New Order Received',
        body: 'You have received a new order #12345 from John Doe.',
        createdAt: DateTime.now().toString(),
        isRead: false,
        type: 'admin',
      ),
      NotificationModel(
        id: '2',
        title: 'System Update',
        body: 'The system will be under maintenance tonight at 12:00 AM.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)).toString(),
        isRead: true,
        type: 'user',
      ),
      NotificationModel(
        id: '3',
        title: 'New User Registered',
        body: 'A new user "Jane Smith" has registered.',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)).toString(),
        isRead: false,
        type: 'admin',
      ),
    ];
  }

  @override
  Future<bool> createNotification({required String title, required String body, required String type}) async {
    const mutation = r'''
      mutation CreateNotification($title: String!, $body: String!, $type: String!) {
        createNotification(title: $title, body: $body, type: $type) {
          id
        }
      }
    ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {
          "query": mutation,
          "variables": {
            "title": title,
            "body": body,
            "type": type,
          },
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.data['errors'] != null) {
        throw Exception(response.data['errors'][0]['message']);
      }

      return true;
    } catch (e) {
      print("Error creating notification: $e");
      // throw Exception('Failed to create notification');
      return false; // Fail silently or handle
    }
  }

  @override
  Future<bool> deleteNotification(String id) async {
    const mutation = r'''
      mutation DeleteNotification($id: ID!) {
        deleteNotification(id: $id)
      }
    ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {
          "query": mutation,
          "variables": {"id": id},
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.data['errors'] != null) {
        throw Exception(response.data['errors'][0]['message']);
      }

      return true;
    } catch (e) {
      print("Error deleting notification: $e");
      return false;
    }
  }
}
