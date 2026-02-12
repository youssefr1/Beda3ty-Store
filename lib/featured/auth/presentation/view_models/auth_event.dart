part of 'auth_bloc.dart';

@freezed
 class AuthEvent with _$AuthEvent{
  const factory AuthEvent.started() = _StartedEvent;
  const factory AuthEvent.login() = LoginEvent;
  const factory AuthEvent.signUp({required String imageUrl}) = SignUpEvent;
  const factory AuthEvent.cancelLoading() = CancelLoadingEvent;


}
