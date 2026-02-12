import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_number_response.g.dart';

@JsonSerializable()
class ProductNumberResponse {
  ProductNumberResponse(this.data);

  factory ProductNumberResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductNumberResponseFromJson(json);

  final ProductNumberModel data;
  String get ProductsNumber {
    if(data.productsList.isEmpty){
      return '0';
    }
    return data.productsList.length.toString();
  }
}

@JsonSerializable()
class ProductNumberModel {
  ProductNumberModel(this.productsList);

  factory ProductNumberModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductNumberModelFromJson(json);
  @JsonKey(name: 'products')
  final List<ProductsNumberTitle> productsList;
}

@JsonSerializable()
class ProductsNumberTitle {
  ProductsNumberTitle(this.title);

  factory ProductsNumberTitle.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductsNumberTitleFromJson(json);

  final String? title;
}
