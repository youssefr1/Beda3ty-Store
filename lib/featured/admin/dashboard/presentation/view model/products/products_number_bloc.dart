import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_number_event.dart';
part 'products_number_state.dart';

class ProductsNumberBloc
    extends Bloc<ProductsNumberEvent, ProductsNumberState> {
  ProductsNumberBloc(this.repo) : super(const ProductsNumberLoading()) {
    on<GetProductsNumber>(_getProductsNumber);
  }

  final DashboardRepo repo;

  FutureOr<void> _getProductsNumber(
    GetProductsNumber event,
    Emitter<ProductsNumberState> emit,
  ) async {
    emit(const ProductsNumberLoading());
    final data = await repo.Productnumber();
    data.when(
      success: (productsdata) {
        emit(ProductsNumberSuccess(productNumber: productsdata.toString()));
      },
      failure: (error) {
        emit(ProductsNumberFailure(error));
      },
    );
  }
}
