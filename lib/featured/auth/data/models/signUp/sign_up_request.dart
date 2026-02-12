import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request.g.dart';
@JsonSerializable()
class SignUpRequest{
  SignUpRequest({required this.name, required this.email, required this.avatar, required this.password});

  final String name;
  final String email;
  final String avatar;
  final String password;

  factory SignUpRequest.toJson(Map<String,dynamic> json) => _$SignUpRequestFromJson(json);
}