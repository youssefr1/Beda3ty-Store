part of 'delete_category_bloc.dart';

@immutable
abstract class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoading extends DeleteCategoryState {}

class DeleteCategorySuccsse extends DeleteCategoryState {}

final class DeleteCategoryFailure extends DeleteCategoryState {
  DeleteCategoryFailure({required this.error});

  final String error;
}
