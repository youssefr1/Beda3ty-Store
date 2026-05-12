part of 'products_number_bloc.dart';

abstract class ProductsNumberState {
  const ProductsNumberState();
}

class ProductsNumberInitial extends ProductsNumberState {
  const ProductsNumberInitial();
}

class ProductsNumberLoading extends ProductsNumberState {
  const ProductsNumberLoading();
}

class ProductsNumberSuccess extends ProductsNumberState {
  final String productNumber;
  const ProductsNumberSuccess({required this.productNumber});
}

class ProductsNumberFailure extends ProductsNumberState {
  final String message;
  const ProductsNumberFailure(this.message);
}
