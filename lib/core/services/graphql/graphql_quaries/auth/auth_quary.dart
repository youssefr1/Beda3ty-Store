import 'package:astro/featured/auth/data/models/login/login_requset.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_request.dart';

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
        login(email: $email, password: $password) {
          access_token
          refresh_token
        }
      }
    ''',
      'variables': {
        'email': body.email,
        'password': body.password,
      }
    };
  }

  Map<String, dynamic> signUpMapQuaries({required SignUpRequest body}) {
    return {
      'query': r'''
          mutation SignUp($name: String!, $email: String!, $password: String!, $avatar: String!) {
          addUser(
            data: {
              name:$name
              email: $email
              password: $password
              avatar: $avatar
              role: customer
            }
          ) {
            id
            email
          }
        }
    ''',
      'variables': {
        'name': body.name,
        'email': body.email,
        'password': body.password,
        'avatar':body.avatar
      }
    };
  }

}
