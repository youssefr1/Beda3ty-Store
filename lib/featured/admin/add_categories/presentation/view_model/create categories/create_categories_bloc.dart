import 'dart:async';
import 'package:astro/featured/admin/add_categories/data/create%20categories/model/create_categories.dart';
import 'package:astro/featured/admin/add_categories/data/create%20categories/repo/create_categories_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'create_categories_event.dart';

part 'create_categories_state.dart';

class CreateCategoriesBloc extends Bloc<CreateCategoriesEvent, CreateCategoriesState> {
  CreateCategoriesBloc(this.repo) : super(CreateCategoriesInitial())
  {
    on<SubmitCreateCategory>(createCategories );
  }
  final CreateCategoriesRepo repo;

  Future<void> createCategories(
      SubmitCreateCategory event,
    Emitter<CreateCategoriesState> emit,
  ) async {
emit(CreateCategoriesLoading());
try {
  final Category =await repo.createCategory(event.name, event.image);
  return emit(CreateCategoriesSuccess(model: Category));
}  catch (e, s) {
  debugPrint('❌ Error in CreateCategoriesBloc: $e');
  debugPrint(s.toString());
  return emit(CreateCategoriesFailure(errorMessage: e.toString()));
}



}
}
