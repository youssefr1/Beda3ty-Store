import 'package:astro/core/services/graphql/dio_factory.dart';
import 'package:astro/featured/auth/data/models/login/login_requset.dart';
import 'package:astro/featured/auth/data/models/login/login_response.dart';
import 'package:astro/featured/auth/data/models/login/user_role_response.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_request.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_response.dart';
import 'package:dio/dio.dart';

class AuthDataSource {
  AuthDataSource(this._dio);

  final Dio _dio;

  /// POST /api/v1/auth/login
  Future<LoginResponse> Login({required LoginRequset body}) async {
    final response = await _dio.post(
      'auth/login',
      data: {
        'email': body.email,
        'password': body.password,
      },
    );
    return LoginResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// GET /api/v1/auth/profile
  Future<UserRoleResponse> getUserRole(String token) async {
    final response = await _dio.get(
      'auth/profile',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return UserRoleResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// POST /api/v1/users (sign up)
  Future<SignUpResponse> signUp({required SignUpRequest body}) async {
    final response = await _dio.post(
      'users',
      data: {
        'name': body.name,
        'email': body.email,
        'password': body.password,
        'avatar': body.avatar,
      },
    );
    return SignUpResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
