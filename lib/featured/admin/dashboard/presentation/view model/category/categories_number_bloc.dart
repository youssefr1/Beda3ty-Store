import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_number_event.dart';
part 'categories_number_state.dart';

class CategoriesNumberBloc
    extends Bloc<CategoriesNumberEvent, CategoriesNumberState> {
  CategoriesNumberBloc(this.repo)
    : super(const CategoriesNumberLoading()) {
    on<GetCategoryNumber>(_getCategoryNumber);
  }
  
  final DashboardRepo repo;

  FutureOr<void> _getCategoryNumber(
    GetCategoryNumber event, 
    Emitter<CategoriesNumberState> emit,
  ) async {
    emit(const CategoriesNumberLoading());
    final data = await repo.Categorynumber();
    data.when(
      success: (categorynum) {
        emit(CategoriesNumberSuccess(categoryNumber: categorynum.toString()));
      },
      failure: (error) {
        emit(CategoriesNumberFailure(error));
      },
    );
  }
}
