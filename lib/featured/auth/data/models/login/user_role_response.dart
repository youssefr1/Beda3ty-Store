class UserRoleResponse {
  UserRoleResponse(this.userRole, this.id);

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      UserRoleResponse(
        json['role'] as String?,
        json['id'] as int?,
      );

  final String? userRole;
  final int? id;
}
