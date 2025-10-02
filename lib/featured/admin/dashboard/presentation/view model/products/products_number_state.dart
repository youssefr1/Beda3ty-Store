part of 'products_number_bloc.dart';

@freezed
 class ProductsNumberState with _$ProductsNumberState {
  const factory ProductsNumberState.succsse({required String productNumber}) = succsseState;
  const factory ProductsNumberState.loading() = loadingState;
  const factory ProductsNumberState.failure(String message) = failureState;
}


