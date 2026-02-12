// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersNumberResponse _$UsersNumberResponseFromJson(Map<String, dynamic> json) =>
    UsersNumberResponse(
      UsersNumberModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersNumberResponseToJson(
  UsersNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

UsersNumberModel _$UsersNumberModelFromJson(Map<String, dynamic> json) =>
    UsersNumberModel(
      (json['users'] as List<dynamic>)
          .map((e) => UsersNumberTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersNumberModelToJson(UsersNumberModel instance) =>
    <String, dynamic>{'users': instance.usersList};

UsersNumberTitle _$UsersNumberTitleFromJson(Map<String, dynamic> json) =>
    UsersNumberTitle(json['name'] as String?);

Map<String, dynamic> _$UsersNumberTitleToJson(UsersNumberTitle instance) =>
    <String, dynamic>{'name': instance.name};
