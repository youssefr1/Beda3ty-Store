import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_number_bloc.freezed.dart';
part 'users_number_event.dart';
part 'users_number_state.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  final DashboardRepo repo;

  UsersNumberBloc(this.repo) : super(const UsersNumberState.loading()) {
    on<getUserNumber>(_getUserNumber);
  }
//hgjkhkgjjkghkjhgffdgsfdsasaddsasdasdadsadsaadsdsa
  Future<void> _getUserNumber(
      getUserNumber event,
      Emitter<UsersNumberState> emit,
      ) async {
    emit(const UsersNumberState.loading());
    final data = await repo.Usersnumber();

    data.when(
      success: (usernum) {
        emit(UsersNumberState.succsse(userNumber: usernum.UsersNumber));
      },
      failure: (error) {
        emit(UsersNumberState.failure(error));
      },
    );
  }
}
