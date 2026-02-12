import 'package:astro/featured/admin/add_products/data/dio.dart';
import 'package:dio/dio.dart';
import '../model/product_model.dart';

class ProductDataSource {
  Future<List<ProductModel>> getAllProducts() async {
    final response = await DioClient.dio.get("products");

    final data = response.data as List;

    return data.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
