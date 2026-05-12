import 'package:dio/dio.dart';

class DashBoardDataSource {
  DashBoardDataSource(this.dio);

  final Dio dio;

  /// GET /api/v1/products → count
  Future<int> productNumber() async {
    final response = await dio.get('/products');
    final data = response.data as List;
    return data.length;
  }

  /// GET /api/v1/categories → count
  Future<int> categoryNumber() async {
    final response = await dio.get('/categories');
    final data = response.data as List;
    return data.length;
  }

  /// GET /api/v1/users → count
  Future<int> userNumber() async {
    final response = await dio.get('/users');
    final data = response.data as List;
    return data.length;
  }
}
