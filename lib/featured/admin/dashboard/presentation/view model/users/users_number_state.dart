part of 'users_number_bloc.dart';

@freezed
 class UsersNumberState with _$UsersNumberState {
  const factory UsersNumberState.succsse({required String userNumber}) = succsseState;
  const factory UsersNumberState.loading() = loadingState;
  const factory UsersNumberState.failure(String message) = failureState;
}

