import 'package:astro/featured/auth/data/models/login_requset.dart';

class AuthQuaries {
  // 3. factory بيرجع نفس النسخة
  factory AuthQuaries() => _instance;

  // 1. private constructor
  AuthQuaries._();

  // 2. static final instance (بيتم إنشاؤه مرة واحدة)
  static final AuthQuaries _instance = AuthQuaries._();

  Map<String, dynamic> loginMapQuaries({required LoginRequset body}) {
    return {
      'query': r'''
            mutation login($email: String!, $password: String!) {
	             login(email: "$email.com", password: $password) {
		            access_token
		              refresh_token
	}
}

      ''',
      'variables':{
        'email':body.email,
        'password':body.password
      }
    };
  }
}
