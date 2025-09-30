import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/services/graphql/api_result.dart';
import 'package:astro/core/utils/app_constant.dart';
import 'package:astro/featured/auth/data/data_source/auth_data_source.dart';
import 'package:astro/featured/auth/data/models/login/login_requset.dart';
import 'package:astro/featured/auth/data/models/login/login_response.dart';
import 'package:astro/featured/auth/data/models/login/user_role_response.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_request.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_response.dart';
import 'package:dio/dio.dart';

class AuthRepos {
  AuthRepos(this._authDataSource);

  final AuthDataSource _authDataSource;

  Future<ApiResult<LoginResponse>> login({
    required LoginRequset body,
  }) async {
    try {
      final response = await _authDataSource.Login(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }




  Future<UserRoleResponse> userRole(String token) async {
      final response = await _authDataSource.getUserRole(token);
       return response;
  }


  Future<ApiResult<SignUpResponse>> signUp({required SignUpRequest body,})async{
    try {
      final response = await _authDataSource.signUp(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }
}
