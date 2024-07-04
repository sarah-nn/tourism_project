import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/room_model.dart';

part 'room_state.dart';

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
}
