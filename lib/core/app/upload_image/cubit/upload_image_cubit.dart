import 'package:astro/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:astro/core/utils/image_pick.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_image_state.dart';

part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo)
    : super(const UploadImageState.initial());
  final UploadImageRepo _repo;

  String _getImageUrl = '';

  // upload image
  Future<void> uploadImage() async {
    final pickImage = await PickImageUtils().pickImage();
    if (pickImage == null) return;

    final result = await _repo.uploadImage(pickImage);
    result.when(
      success: (image) {
        _getImageUrl = image.location ?? '';
        emit(UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.failure(errmessage: error));
      },
    );
  }

  // remove image

 void removeImage(){
    _getImageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: _getImageUrl));
 }
}
