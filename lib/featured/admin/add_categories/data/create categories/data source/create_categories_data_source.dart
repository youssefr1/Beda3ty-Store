import 'package:astro/featured/admin/add_categories/data/create%20categories/model/create_categories.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class CreateCategoriesDataSource {
  Future<CreateCategories> createCategories({
    required String name,
    required String image,
  });
}

class CreateCategoriesDataSourceImp extends CreateCategoriesDataSource {
  CreateCategoriesDataSourceImp({
    required this.dio,
    required this.endPoint,
  });

  final Dio dio;
  final String endPoint;

  @override
  Future<CreateCategories> createCategories({
    required String name,
    required String image,
  }) async {
    // ✅ mutation الصحيحة طبقًا لـ schema الخاص بـ API
    const String mutation = r'''
      mutation AddCategory($data: CreateCategoryDto!) {
        addCategory(data: $data) {
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
            "data": {
              "name": name,
              "image": image,
            }
          },
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      print("✅ Create Category Response: ${response.data}");

      // تحقق أن الـ response يحتوي على البيانات المطلوبة
      if (response.data['data'] == null ||
          response.data['data']['addCategory'] == null) {
        throw Exception("❌ GraphQL mutation failed: ${response.data}");
      }

      final data =
      response.data['data']['addCategory'] as Map<String, dynamic>;
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



