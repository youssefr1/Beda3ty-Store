import 'package:astro/featured/admin/add_products/data/get%20all%20products/model/product_model.dart';
import 'package:astro/featured/admin/add_products/data/get%20all%20products/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit(this.repository) : super(GetAllProductInitial());
  final ProductRepository repository;
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoading());

    try {
      final products = await repository.getAllProducts();
      emit(GetAllProductsSuccess(products));
    } catch (e) {
      emit(GetAllProductsFailure(e.toString()));
    }
  }
}
