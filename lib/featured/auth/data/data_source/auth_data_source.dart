import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/core/services/graphql/graphql_quaries/auth/auth_quary.dart';
import 'package:astro/featured/auth/data/models/login/login_requset.dart';
import 'package:astro/featured/auth/data/models/login/login_response.dart';
import 'package:astro/featured/auth/data/models/login/user_role_response.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_request.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_response.dart';
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


  Future<SignUpResponse> signUp({required SignUpRequest body})async{
    final response = await _graph.signUp(AuthQuaries().signUpMapQuaries(body: body));
    return response;
  }
}