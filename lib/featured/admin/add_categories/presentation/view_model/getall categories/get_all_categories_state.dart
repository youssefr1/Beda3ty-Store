part of 'get_all_categories_bloc.dart';

@immutable
abstract class GetAllCategoriesState {}

final class GetAllCategoriesInitial extends GetAllCategoriesState {}

final class GetAllCategoriesLoading extends GetAllCategoriesState {}

final class GetAllCategoriesSuccsse extends GetAllCategoriesState {
  final List<CategoryModel> categories;
  GetAllCategoriesSuccsse(this.categories);
}

final class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String message;
  GetAllCategoriesFailure(this.message);
}
