part of 'categories_number_bloc.dart';

abstract class CategoriesNumberEvent {
  const CategoriesNumberEvent();
}

class CategoriesNumberStart extends CategoriesNumberEvent {
  const CategoriesNumberStart();
}

class GetCategoryNumber extends CategoriesNumberEvent {
  const GetCategoryNumber();
}
