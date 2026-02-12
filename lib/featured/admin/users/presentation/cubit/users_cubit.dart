import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/users_repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo repo;

  UsersCubit(this.repo) : super(UsersInitial());

  Future<void> fetchUsers() async {
    emit(UsersLoading());
    try {
      final users = await repo.getUsers();
      emit(UsersSuccess(users));
    } catch (e) {
      emit(UsersFailure(e.toString()));
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await repo.deleteUser(id);
      fetchUsers(); // Refresh list after deletion
    } catch (e) {
      // Handle error or emit failure state if needed, but usually for delete we might show a toast
      print("Error deleting user: $e");
    }
  }
}
