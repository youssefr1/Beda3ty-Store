import 'package:astro/core/services/graphql/admin/dashboard_quary.dart';
import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/featured/admin/dashboard/data/models/categorie_number_response.dart';
import 'package:astro/featured/admin/dashboard/data/models/product_number_response.dart';
import 'package:astro/featured/admin/dashboard/data/models/users_number_response.dart';

class DashBoardDataSource {
  DashBoardDataSource(this.graph);

  final ApiService graph;

  Future<ProductNumberResponse> productNumber() async {
    final response = await graph.productNumber(
      DashboardQuery().numberOfProductsMapQuery(),
    );
    return response;
  } Future<CategoriesNumberResponse>categoryNumber() async {
    final response = await graph.categoriesNumber(
      DashboardQuery().numberOfCategoriesMapQuery(),
    );
    return response;
  } Future<UsersNumberResponse> userNumber() async {
    final response = await graph.usersNumber(
      DashboardQuery().numberOfUsersMapQuery(),
    );
    return response;
  }

}
