import 'package:astro/featured/customer/data/model/customer_product_model.dart';

abstract class CustomerHomeState {}

class CustomerHomeInitial extends CustomerHomeState {}

class CustomerHomeLoading extends CustomerHomeState {}

class CustomerHomeSuccess extends CustomerHomeState {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  CustomerHomeSuccess({required this.products, required this.categories});
}

class CustomerHomeError extends CustomerHomeState {
  final String message;
  CustomerHomeError(this.message);
}
