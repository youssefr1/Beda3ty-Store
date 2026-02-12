import 'package:astro/featured/admin/add_categories/data/get all categories/repo/get_all_category_repo.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/model/updata_categories.dart';
import 'package:astro/featured/admin/notifications/data/repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'update_categories_event.dart';
part 'update_categories_state.dart';

class UpdateCategoryBloc extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  final CategoryRepository repository;
  final NotificationRepo notificationRepo;

  UpdateCategoryBloc(this.repository, this.notificationRepo) : super(UpdateCategoryInitial()) {
    on<SubmitUpdateCategory>(_onUpdateCategory);
  }

  Future<void> _onUpdateCategory(
      SubmitUpdateCategory event,
      Emitter<UpdateCategoryState> emit,
      ) async {
    emit(UpdateCategoryLoading());
    try {
      final updatedCategory = await repository.updateCategory(
        id: event.id,
        name: event.name,
        image: event.image,
      );

      // 🔔 Send Notification
      await notificationRepo.createNotification(
        title: "Category Updated",
        body: "Category '${event.name}' has been updated.",
        type: "admin",
      );

      emit(UpdateCategorySuccess(model: updatedCategory));
      await Future.delayed(const Duration(milliseconds: 300));
      emit(UpdateCategoryInitial());
    } catch (e) {
      emit(UpdateCategoryFailure(error: e.toString()));
    }
  }
}
