import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/notifications/data/repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/get all categories/repo/get_all_category_repo.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';

class DeleteCategoriesBloc extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  final CategoryRepository repository;
  final NotificationRepo notificationRepo;

  DeleteCategoriesBloc(this.repository, this.notificationRepo) : super(DeleteCategoryInitial()) {
    on<DeleteCategoriesEvent>(_onDeleteCategory);
  }

  Future<void> _onDeleteCategory(
      DeleteCategoriesEvent event,
      Emitter<DeleteCategoryState> emit,
      ) async {
    emit(DeleteCategoryLoading());
    try {
      final success = await repository.deleteCategory(event.id);
      if (success) {
        // 🔔 Send Notification
        await notificationRepo.createNotification(
          title: "Category Deleted",
          body: "Category ID '${event.id}' has been deleted.",
          type: "admin",
        );
        emit(DeleteCategorySuccsse());
      } else {
        emit(DeleteCategoryFailure(error: "Failed to delete category"));
      }
    } catch (e) {
      emit(DeleteCategoryFailure(error: e.toString()));
    }
  }
}
