part of 'update_categories_bloc.dart';

@immutable
abstract class UpdateCategoryEvent {}

class SubmitUpdateCategory extends UpdateCategoryEvent {
  final int id;
  final String name;
  final String image;

  SubmitUpdateCategory({
    required this.id,
    required this.name,
    required this.image,
  });
}
