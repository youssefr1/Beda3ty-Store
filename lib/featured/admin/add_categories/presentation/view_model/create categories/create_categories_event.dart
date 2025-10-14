part of 'create_categories_bloc.dart';

@immutable
abstract class CreateCategoriesEvent {}
class SubmitCreateCategory extends CreateCategoriesEvent {

  SubmitCreateCategory({
    required this.name,
    required this.image,
  });
  final String name;
  final String image;
}