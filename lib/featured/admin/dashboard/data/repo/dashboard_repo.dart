import 'package:astro/core/services/graphql/api_result.dart';
import 'package:astro/featured/admin/dashboard/data/data%20source/admin_data_source.dart';
import 'package:astro/featured/admin/dashboard/data/models/categorie_number_response.dart';
import 'package:astro/featured/admin/dashboard/data/models/product_number_response.dart';
import 'package:astro/featured/admin/dashboard/data/models/users_number_response.dart';

class DashboardRepo{
  DashboardRepo(this.dataSource);
  final DashBoardDataSource dataSource;

  Future<ApiResult<ProductNumberResponse>> Productnumber () async{
    try {
      final response = await dataSource.productNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }Future<ApiResult<CategoriesNumberResponse>> Categorynumber ()async{
    try {
      final response = await dataSource.categoryNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }Future<ApiResult<UsersNumberResponse>> Usersnumber ()async{
    try {
      final response = await dataSource.userNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }
}