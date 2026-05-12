part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class AuthStartedEvent extends AuthEvent {
  const AuthStartedEvent();
}

class LoginEvent extends AuthEvent {
  const LoginEvent();
}

class SignUpEvent extends AuthEvent {
  final String imageUrl;
  const SignUpEvent({required this.imageUrl});
}

class CancelLoadingEvent extends AuthEvent {
  const CancelLoadingEvent();
}
