import 'dart:async';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_number_event.dart';
part 'users_number_state.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  final DashboardRepo repo;

  UsersNumberBloc(this.repo) : super(const UsersNumberLoading()) {
    on<GetUsersNumber>(_getUserNumber);
  }
  
  Future<void> _getUserNumber(
    GetUsersNumber event,
    Emitter<UsersNumberState> emit,
  ) async {
    emit(const UsersNumberLoading());
    final data = await repo.Usersnumber();

    data.when(
      success: (usernum) {
        emit(UsersNumberSuccess(userNumber: usernum.toString()));
      },
      failure: (error) {
        emit(UsersNumberFailure(error));
      },
    );
  }
}
