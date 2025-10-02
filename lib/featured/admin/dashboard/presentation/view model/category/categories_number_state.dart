part of 'categories_number_bloc.dart';

@freezed
 class CategoriesNumberState  with  _$CategoriesNumberState {
  const factory CategoriesNumberState.succsse({required String categoryNumber}) = succsseState;
  const factory CategoriesNumberState.loading() = loadingState;
  const factory CategoriesNumberState.failure(String message) = failureState;
}


