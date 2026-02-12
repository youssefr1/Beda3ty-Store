part of 'get_all_product_cubit.dart';

@immutable
abstract class GetAllProductState {}

final class GetAllProductInitial extends GetAllProductState {}


class GetAllProductsLoading extends GetAllProductState {}

class GetAllProductsSuccess extends GetAllProductState {
  GetAllProductsSuccess(this.products);
  final List<ProductModel> products;
}

class GetAllProductsFailure extends GetAllProductState {
  GetAllProductsFailure(this.message);
  final String message;
}
