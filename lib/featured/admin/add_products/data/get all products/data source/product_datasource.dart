import 'package:dio/dio.dart';
import '../model/product_model.dart';

class ProductDataSource {
  ProductDataSource({required this.dio});
  
  final Dio dio;

  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get("/products");
    final data = response.data as List;
    return data
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
