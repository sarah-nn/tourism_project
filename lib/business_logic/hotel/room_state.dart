part of'room_cubit.dart';



sealed class RoomState {}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomSuccess extends RoomState {
 final RoomModel roomModel;
  RoomSuccess(this.roomModel);
}

final class RoomFailure extends RoomState {
  final String errMessage;
  RoomFailure({required this.errMessage});
}
