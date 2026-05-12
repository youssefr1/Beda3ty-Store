class SignUpRequest {
  SignUpRequest({
    required this.name,
    required this.email,
    required this.avatar,
    required this.password,
  });

  final String name;
  final String email;
  final String avatar;
  final String password;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'avatar': avatar,
        'password': password,
      };
}
