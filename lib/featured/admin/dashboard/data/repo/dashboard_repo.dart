import 'package:astro/core/services/graphql/api_result.dart';
import 'package:astro/featured/admin/dashboard/data/data%20source/admin_data_source.dart';

class DashboardRepo {
  DashboardRepo(this.dataSource);
  final DashBoardDataSource dataSource;

  Future<ApiResult<int>> Productnumber() async {
    try {
      final response = await dataSource.productNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }

  Future<ApiResult<int>> Categorynumber() async {
    try {
      final response = await dataSource.categoryNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }

  Future<ApiResult<int>> Usersnumber() async {
    try {
      final response = await dataSource.userNumber();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(" please , try later ");
    }
  }
}
