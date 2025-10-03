import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'products_number_bloc.freezed.dart';

part 'products_number_event.dart';

part 'products_number_state.dart';

class ProductsNumberBloc
    extends Bloc<ProductsNumberEvent, ProductsNumberState> {
  ProductsNumberBloc(this.repo)
      : super(const ProductsNumberState.loading()) {
    on<getProductNumber>(GetProductsNumber);
  }

  final DashboardRepo repo;

  FutureOr<void> GetProductsNumber(
      getProductNumber event,
      Emitter<ProductsNumberState> emit,) async {
    emit(const ProductsNumberState.loading());
    final data = await repo.Productnumber();
    data.when(success:
        (productsdata) {
      emit(ProductsNumberState.succsse(productNumber: productsdata.ProductsNumber));
      }, failure: (error){
      emit(ProductsNumberState.failure(error));
    });
  }
}
