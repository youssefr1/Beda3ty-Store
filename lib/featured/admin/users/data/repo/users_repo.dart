import '../data_source/users_data_source.dart';
import '../model/user_model.dart';

abstract class UsersRepo {
  Future<List<UserModel>> getUsers();
  Future<bool> deleteUser(String id);
}

class UsersRepoImpl implements UsersRepo {
  final UsersDataSource dataSource;

  UsersRepoImpl(this.dataSource);

  @override
  Future<List<UserModel>> getUsers() async {
    return await dataSource.getUsers();
  }

  @override
  Future<bool> deleteUser(String id) async {
    return await dataSource.deleteUser(id);
  }
}
