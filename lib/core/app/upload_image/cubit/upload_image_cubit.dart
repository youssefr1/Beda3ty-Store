import 'package:astro/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:astro/core/utils/image_pick.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(const UploadImageInitial());
  final UploadImageRepo _repo;

  String getImageUrl = '';

  // upload image
  Future<void> uploadImage() async {
    final pickImage = await PickImageUtils().pickImage();
    if (pickImage == null) return;

    final result = await _repo.uploadImage(pickImage);
    result.when(
      success: (image) {
        getImageUrl = image.location ?? '';
        emit(const UploadImageSuccess());
      },
      failure: (error) {
        emit(UploadImageFailure(errmessage: error));
      },
    );
  }

  // remove image

  void removeImage() {
    getImageUrl = '';
    emit(UploadImageRemoveImage(imageUrl: getImageUrl));
  }
}
