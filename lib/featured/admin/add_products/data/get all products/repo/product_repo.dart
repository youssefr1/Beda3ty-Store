import 'package:astro/featured/admin/add_products/data/get%20all%20products/data%20source/product_datasource.dart';

import '../model/product_model.dart';

class ProductRepository {

  ProductRepository(this.dataSource);
  final ProductDataSource dataSource;

  Future<List<ProductModel>> getAllProducts() {
    return dataSource.getAllProducts();
  }
}
