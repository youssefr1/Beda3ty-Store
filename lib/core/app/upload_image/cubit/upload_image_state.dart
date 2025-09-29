part of 'upload_image_cubit.dart';
@freezed
 class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _initial;
  const factory UploadImageState.loading() = LoadingState;
  const factory UploadImageState.success() = SuccessState;
  const factory UploadImageState.removeImage({required String imageUrl}) = RemoveImageState;
  const factory UploadImageState.failure({required String errmessage}) = FailureState;
}


