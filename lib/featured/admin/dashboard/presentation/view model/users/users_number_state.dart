part of 'users_number_bloc.dart';

abstract class UsersNumberState {
  const UsersNumberState();
}

class UsersNumberInitial extends UsersNumberState {
  const UsersNumberInitial();
}

class UsersNumberLoading extends UsersNumberState {
  const UsersNumberLoading();
}

class UsersNumberSuccess extends UsersNumberState {
  final String userNumber;
  const UsersNumberSuccess({required this.userNumber});
}

class UsersNumberFailure extends UsersNumberState {
  final String message;
  const UsersNumberFailure(this.message);
}
