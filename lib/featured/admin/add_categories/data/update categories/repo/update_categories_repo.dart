import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/data%20source/get_all_category_dataSource.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/data%20source/update_categoies_data_source.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/model/updata_categories.dart';

abstract class CategoryRepository {
  // ... باقي الميثودات
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  });
}

class CategoryRepositoryImpl extends CategoryRepository {

  CategoryRepositoryImpl({
    required this.dataSource,
    required this.updateDataSource,
  });
  final GetAllCategoryDataSource dataSource;
  final UpdateCategoryDataSource updateDataSource;

  @override
  Future<UpdateCategoryModel> updateCategory({
    required int id,
    required String name,
    required String image,
  }) {
    return updateDataSource.updateCategory(
      id: id,
      name: name,
      image: image,
    );
  }
}
