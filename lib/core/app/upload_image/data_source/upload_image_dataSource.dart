import 'package:astro/core/app/upload_image/model/upload_image_response.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageDataSource {
  UploadImageDataSource(this._dio);

  final Dio _dio;

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

    final response = await _dio.post(
      '/files/upload',
      data: formData,
    );
    return UploadImageResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
