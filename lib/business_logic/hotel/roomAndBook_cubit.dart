import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/room_model.dart';

part 'roomAndBook_state.dart';

bool bookhotel = false;

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomInitial());
  RoomModel? roomModel;
  var data;

  Future<RoomModel?> getRooms(
      {required String hotelId,
      @required String? start,
      @required String? end}) async {
    var uri = Uri.parse(EndPoint.roomHotel + hotelId);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    print("==========================$start");
    print("==========================$end");

    var response = await http.post(uri,
        headers: header, body: {'start_date': start, 'end_date': end});
    try {
      emit(RoomLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        roomModel = RoomModel.fromJson(data);
        print(roomModel);
        emit(RoomSuccess(roomModel!));
      } else {
        var message = json.decode(response.body);
        emit(RoomFailure(errMessage: message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      emit(RoomFailure(errMessage: e.toString()));
    }
    print(roomModel?.data?.capacity2?.price);
    return roomModel;
  }

  Future<void> bookHotel(
      {required String tripName,
      required String tripNote,
      required String destinationTripId,
      required String hotelId,
      required String startDate,
      required String endDate,
      required String countRoomC2,
      required String countRoomC4,
      required String countRoomC6}) async {
    var uri = Uri.parse(EndPoint.bookHotel);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.post(uri, headers: header, body: {
      'destination_trip_id': destinationTripId,
      'hotel_id': hotelId,
      'start_date': startDate,
      'end_date': endDate,
      'count_room_C2': countRoomC2,
      'count_room_C4': countRoomC4,
      'count_room_C6': countRoomC6,
      'trip_name': tripName
    });
    try {
      // emit(RoomLoading());
      if (response.statusCode == 200) {
        emit(BookHotelSuccess());
        print(response.body);
      } else {
        var message = json.decode(response.body);
        print(message);
        emit(BookHotelFailure(errMessage: message['message'].toString()));
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      emit(BookHotelFailure(errMessage: e.toString()));
    }
  }
}
