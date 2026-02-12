part of 'delete_category_bloc.dart';

@immutable
abstract class DeleteCategoryEvent {}

class DeleteCategoriesEvent extends DeleteCategoryEvent {
  DeleteCategoriesEvent({required this.id});
  final int id;
}

