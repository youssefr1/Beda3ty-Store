import 'package:dio/dio.dart';
import '../model/user_model.dart';

abstract class UsersDataSource {
  Future<List<UserModel>> getUsers();
  Future<bool> deleteUser(String id);
}

class UsersDataSourceImpl implements UsersDataSource {
  final Dio dio;

  UsersDataSourceImpl({
    required this.dio,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await dio.get('/users');

      final List<dynamic> data = response.data as List<dynamic>;

      return data
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching users: $e");
      return [];
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      await dio.delete('/users/$id');
      return true;
    } catch (e) {
      print("Error deleting user: $e");
      return false;
    }
  }
}
