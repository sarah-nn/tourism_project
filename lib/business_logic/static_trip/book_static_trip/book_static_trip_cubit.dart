import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/check_trip_num_model.dart';

part 'book_static_trip_state.dart';

class BookStaticTripCubit extends Cubit<BookStaticTripState> {
  BookStaticTripCubit() : super(BookStaticTripInitial());

  CheckNum? checkNum;
  String successMessage = '';

  Future<CheckNum?> checkTrip(String num, String tripId) async {
    emit(BookLoading());
    var header = {'Authorization': 'Bearer $myToken'};
    http.Response response = await http.post(
        Uri.parse(EndPoint.checkStaticTrip + tripId),
        body: {'number_of_friend': num},
        headers: header);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      checkNum = CheckNum.fromJson(message['data']);
      print("checkNum : $message");

      emit(CheckNumSuccess(checkNum: checkNum!));
    } else {
      var message = jsonDecode(response.body);
      print("book fail ${message['message']}");
      emit(BookFail(errMessage: message['message']));
    }
    return checkNum;
  }

  Future<void> bookStaticTrip(
      String tripId,
      String num,
      String roomNeeded,
      String totalPrice,
      String discountPrice,
      String discount,
      String days,
      String roomPrice) async {
    emit(BookLoading());
    var header = {'Authorization': 'Bearer $myToken'};
    http.Response response =
        await http.post(Uri.parse(EndPoint.bookingStaticTrip),
            body: {
              'trip_id': tripId,
              'number_of_friend': num,
              'rooms_needed': roomNeeded,
              'room_price': roomPrice,
              'days': days,
              'total_price': totalPrice,
              'price_after_discount': discountPrice,
              'discount': discount
            },
            headers: header);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      successMessage = message['message'];
      print("book static : $successMessage");

      emit(BookSuccess(successMessage: successMessage));
    } else {
      var message = jsonDecode(response.body);
      print("book fail ${message['message']}");
      emit(BookFail(errMessage: message['message']));
    }
  }

  Future<void> editStaticTrip(String tripId, String num) async {
    emit(BookLoading());
    var header = {'Authorization': 'Bearer $myToken'};
    http.Response response =
        await http.post(Uri.parse(EndPoint.editStaticTrip + tripId),
            body: {
              'new_number_of_friend': num,
            },
            headers: header);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      successMessage = message['message'];
      print("book static : $successMessage");

      emit(BookSuccess(successMessage: successMessage));
    } else {
      var message = jsonDecode(response.body);
      print("book fail ${message['message']}");
      emit(BookFail(errMessage: message['message']));
    }
  }
}
