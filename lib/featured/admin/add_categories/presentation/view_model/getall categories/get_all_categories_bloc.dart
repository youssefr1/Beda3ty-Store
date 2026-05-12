import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/data%20source/get_all_category_dataSource.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/model/get_all_category_model.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/repo/get_all_category_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  final CategoryRepository repository;

  GetAllCategoriesBloc({required this.repository})
    : super(GetAllCategoriesInitial()) {
    on<GetAllCategoriesEvent>(_onGetAllCategories);
    on<RemoveCategoryLocally>((event, emit) {
      if (state is GetAllCategoriesSuccsse) {
        final currentState = state as GetAllCategoriesSuccsse;
        final updatedList = List.of(currentState.categories)
          ..removeWhere((cat) => cat.id == event.categoryId);
        emit(GetAllCategoriesSuccsse(updatedList));
      }
    });
  }

  Future<void> _onGetAllCategories(
    GetAllCategoriesEvent event,
    Emitter<GetAllCategoriesState> emit,
  ) async {
    emit(GetAllCategoriesLoading()); // 1️⃣ أول حالة → تحميل

    try {
      // 2️⃣ استدعاء الداتا من الريبو
      final categories = await repository.getAllCategories();

      // 3️⃣ لو كل حاجة تمام → نغيّر الحالة إلى Loaded
      emit(GetAllCategoriesSuccsse(categories));
    } catch (e) {
      // 4️⃣ لو حصل خطأ → نغيّر الحالة إلى Error
      emit(GetAllCategoriesFailure(e.toString()));
    }
  }
}
