import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/model/get_all_category_model.dart';
import 'package:dio/dio.dart';

abstract class GetAllCategoryDataSource {
  Future<List<CategoryModel>> getAllCategory();
  Future<bool> deleteCategory(int id);
}

class GetAllCategoryDataSourceImpl implements GetAllCategoryDataSource {
  final Dio dio;

  GetAllCategoryDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await dio.get('/categories');

      final data = response.data as List;
      final categories = data
          .map(
            (category) =>
                CategoryModel.fromJson(category as Map<String, dynamic>),
          )
          .toList();

      return categories;
    } on DioException catch (e) {
      print("❌ DioException: \${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      print("❌ error : $e");
      throw Exception('DS error: $e');
    }
  }

  @override
  Future<bool> deleteCategory(int id) async {
    try {
      final response = await dio.delete('/categories/$id');
      return response.data == true || response.data.toString() == 'true';
    } on DioException catch (e) {
      print("❌ DioException: \${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      print("❌ error : $e");
      throw Exception('DS delete error: $e');
    }
  }
}
