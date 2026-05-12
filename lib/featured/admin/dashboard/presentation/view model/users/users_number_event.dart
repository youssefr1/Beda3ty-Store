part of 'users_number_bloc.dart';

abstract class UsersNumberEvent {
  const UsersNumberEvent();
}

class UsersNumberStart extends UsersNumberEvent {
  const UsersNumberStart();
}

class GetUsersNumber extends UsersNumberEvent {
  const GetUsersNumber();
}
