part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileInfo extends ProfileState {
  final UserInfoModel userInfo;

  ProfileInfo({required this.userInfo});
}

final class ProfileChangeFaliure extends ProfileState {
  final String errMessage;

  ProfileChangeFaliure({required this.errMessage});
}

final class DeleteAccountDone extends ProfileState {
  DeleteAccountDone();
}
