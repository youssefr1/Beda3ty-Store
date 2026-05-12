part of 'categories_number_bloc.dart';

abstract class CategoriesNumberState {
  const CategoriesNumberState();
}

class CategoriesNumberInitial extends CategoriesNumberState {
  const CategoriesNumberInitial();
}

class CategoriesNumberLoading extends CategoriesNumberState {
  const CategoriesNumberLoading();
}

class CategoriesNumberSuccess extends CategoriesNumberState {
  final String categoryNumber;
  const CategoriesNumberSuccess({required this.categoryNumber});
}

class CategoriesNumberFailure extends CategoriesNumberState {
  final String message;
  const CategoriesNumberFailure(this.message);
}
