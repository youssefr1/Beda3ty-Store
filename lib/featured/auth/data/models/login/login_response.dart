import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse(this.data);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'data')   // <<<<< مهم جداً
  final LoginDataModel data;
}

@JsonSerializable()
class LoginDataModel {
  LoginDataModel(this.login);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  final LoginModel login;  // <<<<< key اسمه login مش loginModel
}

@JsonSerializable()
class LoginModel {
  LoginModel({this.accessToken, this.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
}
