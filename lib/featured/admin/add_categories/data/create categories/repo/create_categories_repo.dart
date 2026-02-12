import 'package:astro/featured/admin/add_categories/data/create%20categories/data%20source/create_categories_data_source.dart';
import 'package:astro/featured/admin/add_categories/data/create%20categories/model/create_categories.dart';

class CreateCategoriesRepo{
  CreateCategoriesRepo({required this.dataSource});

  final CreateCategoriesDataSource dataSource;


  Future<CreateCategories> createCategory(String name, String image) {

    return dataSource.createCategories(name: name ,image: image);
  }
}