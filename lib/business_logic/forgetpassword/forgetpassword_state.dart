part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetpasswordSuccess extends ForgetpasswordState {
  final String? messageSuccess;
  ForgetpasswordSuccess({@required this.messageSuccess});
}

final class ForgetpasswordLoading extends ForgetpasswordState {}

final class ForgetpasswordFailure extends ForgetpasswordState {
  final String messageFail;

  ForgetpasswordFailure({required this.messageFail});
}
