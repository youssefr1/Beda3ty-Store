import 'package:astro/featured/admin/add_categories/data/update%20categories/model/updata_categories.dart';
import 'package:dio/dio.dart';

abstract class UpdateCategoryDataSource {
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  });
}

class UpdateCategoryDataSourceImpl extends UpdateCategoryDataSource {
  final Dio dio;

  UpdateCategoryDataSourceImpl({required this.dio});

  @override
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  }) async {
    try {
      final response = await dio.put(
        '/categories/$id',
        data: {
          "name": name,
          "image": image,
        },
      );

      print("✅ Update Category Response: ${response.data}");

      final data = response.data as Map<String, dynamic>;
      return UpdateCategoryModel.fromJson(data);
    } on DioException catch (e) {
      print("❌ DioException: ${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      throw Exception('UpdateCategory DS error: $e');
    }
  }
}
