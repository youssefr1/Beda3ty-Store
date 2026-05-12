import 'package:astro/featured/customer/data/model/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationState {
  NotificationState({this.notifications = const []});
  final List<NotificationModel> notifications;

  int get unreadCount => notifications.where((n) => !n.isRead).length;
}

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState());

  void addNotification(NotificationModel notification) {
    final updatedList = List<NotificationModel>.from(state.notifications)
      ..insert(0, notification);
    emit(NotificationState(notifications: updatedList));
  }

  void markAsRead() {
    final updatedList = state.notifications.map((n) {
      n.isRead = true;
      return n;
    }).toList();
    emit(NotificationState(notifications: updatedList));
  }

  void clearNotifications() {
    emit(NotificationState(notifications: []));
  }
}
