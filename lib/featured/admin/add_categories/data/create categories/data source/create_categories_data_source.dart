import 'package:astro/featured/admin/add_categories/data/create%20categories/model/create_categories.dart';
import 'package:dio/dio.dart';

abstract class CreateCategoriesDataSource {
  Future<CreateCategories> createCategories({
    required String name,
    required String image,
  });
}

class CreateCategoriesDataSourceImp extends CreateCategoriesDataSource {
  CreateCategoriesDataSourceImp({required this.dio});

  final Dio dio;

  @override
  Future<CreateCategories> createCategories({
    required String name,
    required String image,
  }) async {
    try {
      final response = await dio.post(
        '/categories',
        data: {
          "name": name,
          "image": image,
        },
      );

      print("✅ Create Category Response: ${response.data}");

      final data = response.data as Map<String, dynamic>;
      return CreateCategories.fromJson(data.cast<dynamic, String>());
    } on DioException catch (e) {
      print("❌ DioException: ${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      print("❌ CreateCategory DS error: $e");
      throw Exception('CreateCategory DS error: $e');
    }
  }
}
