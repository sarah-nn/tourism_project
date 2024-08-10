part of 'delete_edit_static_trip_cubit.dart';

class DeleteEditBookStaticState {}

final class DeleteBookStaticInitial extends DeleteEditBookStaticState {}

final class DeleteBookStaticSuccess extends DeleteEditBookStaticState {
  final String message;
  final int deletedStaticId;
  DeleteBookStaticSuccess(this.message, this.deletedStaticId);
}

final class DeleteBookStaticFailure extends DeleteEditBookStaticState {
  final String errMessage;
  DeleteBookStaticFailure({required this.errMessage});
}

final class ShowPriceLoading extends DeleteBookStaticInitial {}

final class ShowPriceSuccess extends DeleteBookStaticInitial {
  final ShowDetailsPriceStatic showDetailsPriceStatic;

  ShowPriceSuccess({required this.showDetailsPriceStatic});
}

final class ShowPriceFail extends DeleteBookStaticInitial {
  final String errMessage;

  ShowPriceFail({required this.errMessage});
}
