import 'package:freezed_annotation/freezed_annotation.dart';

part 'categorie_number_response.g.dart';

@JsonSerializable()
class CategoriesNumberResponse {
  CategoriesNumberResponse(this.data);

  factory CategoriesNumberResponse.fromJson(
      Map<String, dynamic> json,
      ) => _$CategoriesNumberResponseFromJson(json);

  final CategoriesNumberModel data;
  String get categoriessNumber {
    if(data.categoriesList.isEmpty){
      return '0';
    }
    return data.categoriesList.length.toString();
  }
}

@JsonSerializable()
class CategoriesNumberModel {
  CategoriesNumberModel(this.categoriesList);

  factory CategoriesNumberModel.fromJson(
      Map<String, dynamic> json,
      ) => _$CategoriesNumberModelFromJson(json);
  @JsonKey(name: 'categories')
  final List<CategoriesNumberTitle> categoriesList;
}

@JsonSerializable()
class CategoriesNumberTitle {
  CategoriesNumberTitle(this.name);

  factory CategoriesNumberTitle.fromJson(
      Map<String, dynamic> json,
      ) => _$CategoriesNumberTitleFromJson(json);

  final String? name;
}
