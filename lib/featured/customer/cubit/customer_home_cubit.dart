import 'package:astro/featured/customer/cubit/customer_home_state.dart';
import 'package:astro/featured/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit(this._repo) : super(CustomerHomeInitial());

  final CustomerRepo _repo;

  Future<void> getHomeData() async {
    emit(CustomerHomeLoading());
    
    final productsResult = await _repo.getAllProducts();
    final categoriesResult = await _repo.getAllCategories();

    productsResult.when(
      success: (products) {
        categoriesResult.when(
          success: (categories) {
            emit(CustomerHomeSuccess(products: products, categories: categories));
          },
          failure: (error) => emit(CustomerHomeError(error)),
        );
      },
      failure: (error) => emit(CustomerHomeError(error)),
    );
  }
}
