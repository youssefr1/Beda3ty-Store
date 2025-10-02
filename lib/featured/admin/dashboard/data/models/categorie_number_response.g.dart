// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesNumberResponse _$CategoriesNumberResponseFromJson(
  Map<String, dynamic> json,
) => CategoriesNumberResponse(
  CategoriesNumberModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoriesNumberResponseToJson(
  CategoriesNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

CategoriesNumberModel _$CategoriesNumberModelFromJson(
  Map<String, dynamic> json,
) => CategoriesNumberModel(
  (json['categories'] as List<dynamic>)
      .map((e) => CategoriesNumberTitle.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoriesNumberModelToJson(
  CategoriesNumberModel instance,
) => <String, dynamic>{'categories': instance.categoriesList};

CategoriesNumberTitle _$CategoriesNumberTitleFromJson(
  Map<String, dynamic> json,
) => CategoriesNumberTitle(json['name'] as String?);

Map<String, dynamic> _$CategoriesNumberTitleToJson(
  CategoriesNumberTitle instance,
) => <String, dynamic>{'name': instance.name};
