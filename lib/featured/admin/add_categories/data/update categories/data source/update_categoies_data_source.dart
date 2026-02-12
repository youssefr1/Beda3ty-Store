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
  final String endPoint;

  UpdateCategoryDataSourceImpl({
    required this.dio,
    required this.endPoint,
  });

  @override
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  }) async {
    const String mutation = r'''
      mutation UpdateCategory($id: ID!, $changes: UpdateCategoryDto!) {
        updateCategory(id: $id, changes: $changes) {
          id
          name
          image
        }
      }
    ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {
          "query": mutation,
          "variables": {
            "id": id,
            "changes": {"name": name, "image": image},
          },
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      print("✅ Update Category Response: ${response.data}");

      final data = response.data['data']['updateCategory'] as Map<String, dynamic>;
      return UpdateCategoryModel.fromJson(data);
    } on DioException catch (e) {
      print("❌ DioException: ${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      throw Exception('UpdateCategory DS error: $e');
    }
  }
}
