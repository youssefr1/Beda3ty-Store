import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistUpdated extends WishlistState {
  WishlistUpdated(this.products);
  final List<ProductModel> products;
}

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final List<ProductModel> _products = [];

  List<ProductModel> get products => List.unmodifiable(_products);

  void toggleWishlist(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products.removeAt(index);
    } else {
      _products.add(product);
    }
    emit(WishlistUpdated(List.from(_products)));
  }

  bool isFavorite(int productId) {
    return _products.any((p) => p.id == productId);
  }
}
