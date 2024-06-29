part of 'upload_image_cubit.dart';

sealed class UploadImageState {}

final class UploadImageInitial extends UploadImageState {}

final class ProfileUploadProfilePic extends UploadImageState {}

final class ProfileImageChanged extends UploadImageState {
  final String myImage;

  ProfileImageChanged({required this.myImage});
}

final class ChangeImageFail extends UploadImageState {
  final String errMessage;

  ChangeImageFail({required this.errMessage});
}
