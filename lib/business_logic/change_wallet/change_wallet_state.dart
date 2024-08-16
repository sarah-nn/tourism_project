part of 'change_wallet_cubit.dart';

@immutable
sealed class ChangeWalletState {}

final class ChangeWalletInitial extends ChangeWalletState {}

final class ChangeWalletLoading extends ChangeWalletState {}

final class ChangeWalletSuccess extends ChangeWalletState {
  final String money;
  ChangeWalletSuccess({required this.money});
}

final class ChangeWalletFail extends ChangeWalletState {
  final String errMessage;
  ChangeWalletFail({required this.errMessage});
}
