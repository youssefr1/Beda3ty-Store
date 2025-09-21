import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/core/services/graphql/graphql_quaries/auth/auth_quary.dart';
import 'package:astro/featured/auth/data/models/login_requset.dart';
import 'package:astro/featured/auth/data/models/login_response.dart';
import 'package:astro/featured/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';

class AuthDataSource{
  AuthDataSource(this._graph) ;

  final ApiService _graph;
  Future<LoginResponse> Login({required LoginRequset body })async{
final response = await _graph.login(AuthQuaries().loginMapQuaries(body: body));
return response;
  }

  Future<UserRoleResponse> getUserRole(String token)async{
    final dio = Dio();
    dio.options.headers['Authorization']= 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userProfile();
    print('user role => ${response.userRole}');
    return response;
  }
}