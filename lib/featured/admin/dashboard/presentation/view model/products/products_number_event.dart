part of 'products_number_bloc.dart';

abstract class ProductsNumberEvent {
  const ProductsNumberEvent();
}

class ProductsNumberStart extends ProductsNumberEvent {
  const ProductsNumberStart();
}

class GetProductsNumber extends ProductsNumberEvent {
  const GetProductsNumber();
}
