part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final String userRole;
  const AuthSuccess({required this.userRole});
}

class AuthFailure extends AuthState {
  final String errmessage;
  const AuthFailure({required this.errmessage});
}
