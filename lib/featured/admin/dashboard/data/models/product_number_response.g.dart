// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductNumberResponse _$ProductNumberResponseFromJson(
  Map<String, dynamic> json,
) => ProductNumberResponse(
  ProductNumberModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductNumberResponseToJson(
  ProductNumberResponse instance,
) => <String, dynamic>{'data': instance.data};

ProductNumberModel _$ProductNumberModelFromJson(Map<String, dynamic> json) =>
    ProductNumberModel(
      (json['products'] as List<dynamic>)
          .map((e) => ProductsNumberTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductNumberModelToJson(ProductNumberModel instance) =>
    <String, dynamic>{'products': instance.productsList};

ProductsNumberTitle _$ProductsNumberTitleFromJson(Map<String, dynamic> json) =>
    ProductsNumberTitle(json['title'] as String?);

Map<String, dynamic> _$ProductsNumberTitleToJson(
  ProductsNumberTitle instance,
) => <String, dynamic>{'title': instance.title};
