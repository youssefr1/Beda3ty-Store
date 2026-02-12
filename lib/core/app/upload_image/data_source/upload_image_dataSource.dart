import 'package:astro/core/app/upload_image/model/upload_image_response.dart';
import 'package:astro/core/services/graphql/api_service.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageDataSource {
  UploadImageDataSource(this._graphQl);

  final ApiService _graphQl;

  Future<UploadImageResponse> uploadImage({
    required XFile imageFile,
  }) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(imageFile.path),
      ),
    );

    final response = await _graphQl.uploadImage(formData);
    return response;
  }
}
