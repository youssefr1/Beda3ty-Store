import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/notification_model.dart';
import '../../data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;

  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await repo.getNotifications();
      emit(NotificationSuccess(notifications));
    } catch (e) {
      emit(NotificationFailure(e.toString()));
    }
  }

  Future<void> sendNotification({required String title, required String body, required String type}) async {
    // This method can be used to manually trigger a notification from UI or other Blocs
    try {
      await repo.createNotification(title: title, body: body, type: type);
      // Optionally refresh list
      fetchNotifications();
    } catch (e) {
      // Handle error silently or emit failure if needed
      print("Failed to send notification: $e");
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      await repo.deleteNotification(id);
      fetchNotifications(); // Refresh list after deletion
    } catch (e) {
      print("Failed to delete notification: $e");
    }
  }
}
