class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.avatar,
    this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'].toString(),
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String?,
    );
  }
  final String id;
  final String name;
  final String avatar;
  final String? email;
}
