part of 'create_categories_bloc.dart';

@immutable
abstract class CreateCategoriesState {}

final class CreateCategoriesInitial extends CreateCategoriesState {}

final class CreateCategoriesSuccess extends CreateCategoriesState {
  CreateCategoriesSuccess({required this.model});

  final CreateCategories model;
}

final class CreateCategoriesLoading extends CreateCategoriesState {}

final class CreateCategoriesFailure extends CreateCategoriesState {
  CreateCategoriesFailure({required this.errorMessage});

  final String errorMessage;
}
