part of 'categories_number_bloc.dart';

@freezed
 class CategoriesNumberEvent with _$CategoriesNumberEvent {
  const factory CategoriesNumberEvent.Start() = _start;
  const factory CategoriesNumberEvent.getCategoryNumber() = getCategoryNumber;
}
