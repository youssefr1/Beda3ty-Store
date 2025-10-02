part of 'users_number_bloc.dart';

@freezed
 class UsersNumberEvent with _$UsersNumberEvent {
  const factory UsersNumberEvent.Start() = _start;
  const factory UsersNumberEvent.getUserNumber() = getUserNumber;
}
