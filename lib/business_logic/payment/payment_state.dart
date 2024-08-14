part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  PaymentModel paymentModel;
  PaymentSuccess(this.paymentModel);
}

final class PaymentFailure extends PaymentState {
  final String errMessage;
  PaymentFailure({required this.errMessage});
}
