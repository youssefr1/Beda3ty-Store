import 'package:dio/dio.dart';
import '../model/get_all_category_model.dart';

abstract class GetAllCategoryDataSource {
  Future<List<CategoryModel>> getAllCategory();
  Future<bool> deleteCategory(int id);
}

class GetAllCategoryDataSourceImpl implements GetAllCategoryDataSource {
  final Dio dio;
  final String endPoint;

  GetAllCategoryDataSourceImpl({
    required this.dio,
    required this.endPoint,
  });

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    const query = r'''
      query {
        categories {
          id
          name
          image
        }
      }
    ''';

    final response = await dio.post(
      endPoint,
      data: {"query": query},
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    final List<dynamic> data =
    response.data['data']['categories'] as List<dynamic>;

    // ✅ نحول الـ data إلى List من الموديل
    final categories = data
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();

    // ✅ نرجعها بالعكس (أحدث عنصر أول)
    return categories.reversed.toList();
  }
  Future<bool> deleteCategory(int id) async {
    const String mutation = r'''
    mutation DeleteCategory($id: ID!) {
      deleteCategory(id: $id)
    }
  ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {
          "query": mutation,
          "variables": {"id": id},
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      print("🗑️ Delete Category Response: ${response.data}");

      if (response.data['errors'] != null) {
        throw Exception(response.data['errors'][0]['message']);
      }

      return response.data['data']['deleteCategory'] == true;
    } catch (e) {
      print("❌ Delete Category error: $e");
      throw Exception('DeleteCategory DS error: $e');
    }
  }
}
