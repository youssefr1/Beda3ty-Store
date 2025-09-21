part of 'auth_bloc.dart';

@freezed
 class AuthEvent with _$AuthEvent{
  const factory AuthEvent.started() = _StartedEvent;
  const factory AuthEvent.login() = LoginEvent;

}
