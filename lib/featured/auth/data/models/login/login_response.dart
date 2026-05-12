class LoginResponse {
  LoginResponse({this.accessToken, this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['access_token'] as String?,
        refreshToken: json['refresh_token'] as String?,
      );

  final String? accessToken;
  final String? refreshToken;
}
