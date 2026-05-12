class SignUpResponse {
  SignUpResponse({this.id, this.email, this.name});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        id: json['id'] as int?,
        email: json['email'] as String?,
        name: json['name'] as String?,
      );

  final int? id;
  final String? email;
  final String? name;
}
