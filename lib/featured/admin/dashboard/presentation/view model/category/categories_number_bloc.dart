import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'categories_number_bloc.freezed.dart';

part 'categories_number_event.dart';

part 'categories_number_state.dart';

class CategoriesNumberBloc
    extends
        Bloc<CategoriesNumberEvent, CategoriesNumberState> {
  CategoriesNumberBloc(this.repo)
    : super(const CategoriesNumberState.loading()) {
    on<getCategoryNumber>(GetCategoryNumber);
  }
  final DashboardRepo repo;
  FutureOr<void> GetCategoryNumber(
    getCategoryNumber event,
    Emitter<CategoriesNumberState> emit,
  ) async{
    final data = await repo.Categorynumber();
    data.when(success:
        (categorynum) {
      emit(CategoriesNumberState.succsse(categoryNumber:categorynum.categoriessNumber ));
    }, failure: (error){
      emit(CategoriesNumberState.failure(error));
    });
  }
}
