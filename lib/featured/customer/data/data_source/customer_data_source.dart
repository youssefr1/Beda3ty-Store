import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:dio/dio.dart';

abstract class CustomerDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<CategoryModel>> getAllCategories();
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
}

class CustomerDataSourceImpl implements CustomerDataSource {
  CustomerDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await _dio.get('products');
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _dio.get('categories');
    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final response = await _dio.get('products/', queryParameters: {'categoryId': categoryId});
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
