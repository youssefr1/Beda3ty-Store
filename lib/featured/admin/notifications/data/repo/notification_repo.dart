import '../data_source/notification_data_source.dart';
import '../model/notification_model.dart';

abstract class NotificationRepo {
  Future<List<NotificationModel>> getNotifications();
  Future<bool> createNotification({required String title, required String body, required String type});
  Future<bool> deleteNotification(String id);
}

class NotificationRepoImpl implements NotificationRepo {
  final NotificationDataSource dataSource;

  NotificationRepoImpl(this.dataSource);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    return await dataSource.getNotifications();
  }

  @override
  Future<bool> createNotification({required String title, required String body, required String type}) async {
    return await dataSource.createNotification(title: title, body: body, type: type);
  }

  @override
  Future<bool> deleteNotification(String id) async {
    return await dataSource.deleteNotification(id);
  }
}
