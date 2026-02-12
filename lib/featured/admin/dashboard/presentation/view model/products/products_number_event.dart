part of 'products_number_bloc.dart';

@freezed
sealed class ProductsNumberEvent with _$ProductsNumberEvent {
  const factory ProductsNumberEvent.Start() = _start;
  const factory ProductsNumberEvent.getProductNumber() = getProductNumber;
}
