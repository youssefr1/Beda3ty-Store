import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/data%20source/get_all_category_dataSource.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/model/get_all_category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<bool> deleteCategory(int id);

}

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.dataSource});
  final GetAllCategoryDataSource dataSource;
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
  Future<bool> deleteCategory(int id)async {
    return await dataSource.deleteCategory(id);
  }
}
