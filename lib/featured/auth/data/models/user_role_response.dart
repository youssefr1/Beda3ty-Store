
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_response.g.dart';
@JsonSerializable()
class UserRoleResponse{
  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);
  UserRoleResponse(this.userRole);
@JsonKey(name:'role' )
  final String? userRole;
}