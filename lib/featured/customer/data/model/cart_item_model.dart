import 'package:astro/featured/customer/data/model/customer_product_model.dart';

class CartItemModel {
  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  final ProductModel product;
  int quantity;

  double get totalPrice => (product.price * quantity).toDouble();

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
