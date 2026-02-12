part of 'get_all_categories_bloc.dart';

@immutable
 abstract class GetAllCategoriesEvent {}
class CategoryEvent extends GetAllCategoriesEvent {

}
class RemoveCategoryLocally extends GetAllCategoriesEvent {
 RemoveCategoryLocally(this.categoryId);
 final String categoryId;
}