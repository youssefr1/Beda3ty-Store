import 'package:astro/featured/customer/cubit/category_products_state.dart';
import 'package:astro/featured/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this._repo) : super(CategoryProductsInitial());

  final CustomerRepo _repo;

  Future<void> getProductsByCategory(int categoryId) async {
    emit(CategoryProductsLoading());
    final result = await _repo.getProductsByCategory(categoryId);
    result.when(
      success: (products) => emit(CategoryProductsSuccess(products)),
      failure: (error) => emit(CategoryProductsError(error)),
    );
  }
}
