import 'package:astro/core/app/upload_image/data_source/upload_image_dataSource.dart';
import 'package:astro/core/app/upload_image/model/upload_image_response.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/services/graphql/api_result.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepo {
  UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResponse>> uploadImage(XFile file) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: file);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }
}
