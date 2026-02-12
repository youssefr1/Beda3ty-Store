import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/data%20source/get_all_category_dataSource.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/model/get_all_category_model.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/data%20source/update_categoies_data_source.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/model/updata_categories.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<bool> deleteCategory(int id);
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  });
}

class CategoryRepositoryImpl implements CategoryRepository {
  final GetAllCategoryDataSource dataSource;
  final UpdateCategoryDataSourceImpl updateDataSource; // ✅ أضفنا دا

  CategoryRepositoryImpl({
    required this.dataSource,
    required this.updateDataSource,
  });

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final categories = await dataSource.getAllCategory();
      return categories;
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  @override
  Future<bool> deleteCategory(int id) async {
    return await dataSource.deleteCategory(id);
  }

  @override
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  }) async {
    // ✅ هنا نستخدم instance من updateDataSource
    return await updateDataSource.updateCategory(
      id: id,
      name: name,
      image: image,
    );
  }
}
