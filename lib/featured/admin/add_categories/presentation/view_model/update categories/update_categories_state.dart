part of 'update_categories_bloc.dart';

@immutable
abstract class UpdateCategoryState {}

class UpdateCategoryInitial extends UpdateCategoryState {}

class UpdateCategoryLoading extends UpdateCategoryState {}

class UpdateCategorySuccess extends UpdateCategoryState {
  final UpdateCategoryModel model;
  UpdateCategorySuccess({required this.model});
}

class UpdateCategoryFailure extends UpdateCategoryState {
  final String error;
  UpdateCategoryFailure({required this.error});
}
