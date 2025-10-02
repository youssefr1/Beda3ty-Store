import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_number_response.g.dart';

@JsonSerializable()
class UsersNumberResponse {
  UsersNumberResponse(this.data);

  factory UsersNumberResponse.fromJson(
      Map<String, dynamic> json,
      ) => _$UsersNumberResponseFromJson(json);

  final UsersNumberModel data;
  String get UsersNumber {
    if(data.usersList.isEmpty){
      return '0';
    }
    return data.usersList.length.toString();
  }
}

@JsonSerializable()
class UsersNumberModel {
  UsersNumberModel(this.usersList);

  factory UsersNumberModel.fromJson(
      Map<String, dynamic> json,
      ) => _$UsersNumberModelFromJson(json);
  @JsonKey(name: 'users')
  final List<UsersNumberTitle> usersList;
}

@JsonSerializable()
class UsersNumberTitle {
  UsersNumberTitle(this.name);

  factory UsersNumberTitle.fromJson(
      Map<String, dynamic> json,
      ) => _$UsersNumberTitleFromJson(json);

  final String? name;
}
