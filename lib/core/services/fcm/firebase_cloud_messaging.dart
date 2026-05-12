import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/foundation.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();
  static final FirebaseCloudMessaging instance = FirebaseCloudMessaging._();

  final String _endpoint =
      'https://fcm.googleapis.com/v1/projects/beda3ty-store/messages:send';

  /// Gets an access token from the service account JSON file.
  Future<String> getAccessToken() async {
    try {
      debugPrint('🔄 [FCM Service]: Loading service account JSON...');
      final serviceAccountJson = await rootBundle.loadString(
          'beda3ty-store-firebase-adminsdk-fbsvc-1900593684.json');
      
      final accountCredentials = ServiceAccountCredentials.fromJson(serviceAccountJson);
      final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      
      debugPrint('🔄 [FCM Service]: Requesting OAuth2 token...');
      final client = await clientViaServiceAccount(accountCredentials, scopes);
      final accessToken = client.credentials.accessToken.data;
      client.close();
      debugPrint('✅ [FCM Service]: Token retrieved successfully');
      return accessToken;
    } catch (e) {
      debugPrint('❌ [FCM Service Error]: Failed to get access token: $e');
      rethrow;
    }
  }

  /// Sends a notification to the "all_users" topic.
  Future<void> sendTopicNotification({
    required String title,
    required String body,
  }) async {
    try {
      final token = await getAccessToken().timeout(const Duration(seconds: 10), onTimeout: () {
        throw 'Token retrieval timed out after 10 seconds';
      });
      
      debugPrint('🔄 [FCM Service]: Sending notification to topic...');
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 10);
      dio.options.receiveTimeout = const Duration(seconds: 10);

      final data = {
        "message": {
          "topic": "all_users",
          "notification": {
            "title": title,
            "body": body,
          },
          "android": {
            "notification": {
              "channel_id": "high_importance_channel"
            }
          },
          "data": {
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "status": "done"
          }
        }
      };

      final response = await dio.post(
        _endpoint,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('✅ [FCM Service]: Notification sent successfully: ${response.data}');
    } catch (e) {
      debugPrint('❌ [FCM Service Error]: Failed to send notification: $e');
      rethrow;
    }
  }
}
