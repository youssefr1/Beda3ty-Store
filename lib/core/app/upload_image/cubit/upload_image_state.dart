part of 'upload_image_cubit.dart';

abstract class UploadImageState {
  const UploadImageState();
}

class UploadImageInitial extends UploadImageState {
  const UploadImageInitial();
}

class UploadImageLoading extends UploadImageState {
  const UploadImageLoading();
}

class UploadImageSuccess extends UploadImageState {
  const UploadImageSuccess();
}

class UploadImageRemoveImage extends UploadImageState {
  final String imageUrl;
  const UploadImageRemoveImage({required this.imageUrl});
}

class UploadImageFailure extends UploadImageState {
  final String errmessage;
  const UploadImageFailure({required this.errmessage});
}
