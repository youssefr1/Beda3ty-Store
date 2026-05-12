import 'package:astro/core/services/graphql/api_result.dart';
import 'package:astro/featured/customer/data/data_source/customer_data_source.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';

abstract class CustomerRepo {
  Future<ApiResult<List<ProductModel>>> getAllProducts();
  Future<ApiResult<List<CategoryModel>>> getAllCategories();
  Future<ApiResult<List<ProductModel>>> getProductsByCategory(int categoryId);
}

class CustomerRepoImpl implements CustomerRepo {
  CustomerRepoImpl(this._dataSource);

  final CustomerDataSource _dataSource;

  @override
  Future<ApiResult<List<ProductModel>>> getAllProducts() async {
    try {
      final response = await _dataSource.getAllProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await _dataSource.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<List<ProductModel>>> getProductsByCategory(int categoryId) async {
    try {
      final response = await _dataSource.getProductsByCategory(categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
