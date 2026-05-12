import 'package:astro/featured/customer/data/model/cart_item_model.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  CartUpdated(this.items);
  final List<CartItemModel> items;
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  void addToCart(ProductModel product) {
    // Check if product already exists in cart
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(product: product));
    }
    emit(CartUpdated(List.from(_items)));
  }

  void removeFromCart(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    emit(CartUpdated(List.from(_items)));
  }

  void updateQuantity(int productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      emit(CartUpdated(List.from(_items)));
    }
  }

  void clearCart() {
    _items.clear();
    emit(CartUpdated(List.from(_items)));
  }

  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);
}
