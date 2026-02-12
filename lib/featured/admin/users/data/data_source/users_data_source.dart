import 'package:dio/dio.dart';
import '../model/user_model.dart';

abstract class UsersDataSource {
  Future<List<UserModel>> getUsers();
  Future<bool> deleteUser(String id);
}

class UsersDataSourceImpl implements UsersDataSource {
  final Dio dio;
  final String endPoint;

  UsersDataSourceImpl({
    required this.dio,
    required this.endPoint,
  });

  @override
  Future<List<UserModel>> getUsers() async {
    const query = r'''
      query {
        users {
          id
          name
          email
          role
          avatar
        }
      }
    ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {"query": query},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.data['data'] == null) {
        return [];
      }

      final List<dynamic> data = response.data['data']['users'] as List<dynamic>;

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
    const mutation = r'''
      mutation DeleteUser($id: ID!) {
        deleteUser(id: $id)
      }
    ''';

    try {
      final response = await dio.post(
        endPoint,
        data: {
          "query": mutation,
          "variables": {"id": id},
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

       if (response.data['errors'] != null) {
        throw Exception(response.data['errors'][0]['message']);
      }

      return true;
    } catch (e) {
      print("Error deleting user: $e");
      return false;
    }
  }
}
