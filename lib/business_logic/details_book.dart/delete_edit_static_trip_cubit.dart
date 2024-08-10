import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/data/models/check_trip_num_model.dart';
import 'package:tourism_project/data/models/show_details_price_static_model.dart';

part 'delete_edit_static_trip_state.dart';

class DeleteEditBookStaticCubit extends Cubit<DeleteEditBookStaticState> {
  DeleteEditBookStaticCubit() : super(DeleteBookStaticInitial());
  dynamic message;

  Future<void> deleteStaticTrip(String id) async {
    var uri = Uri.parse(EndPoint.deleteBookStaticTrip + id);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.delete(uri, headers: header);
    try {
      if (response.statusCode == 400) {
        message = json.decode(response.body);
        print('${message}');
        emit(DeleteBookStaticSuccess(message['message']!, int.parse(id)));
      } else {
        message = json.decode(response.body);
        emit(DeleteBookStaticFailure(errMessage: message['message']));
        print('${message}');
      }
    } catch (e) {
      emit(DeleteBookStaticFailure(errMessage: e.toString()));
    }
  }

  ShowDetailsPriceStatic? showDetailsPriceStatic;
  String successMessage = '';

  Future<ShowDetailsPriceStatic?> showPrice(String tripId) async {
    emit(ShowPriceLoading());
    var header = {'Authorization': 'Bearer $myToken'};
    http.Response response = await http.get(
        Uri.parse(EndPoint.showDetailPriceTrippStatic + tripId),
        headers: header);
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      showDetailsPriceStatic = ShowDetailsPriceStatic.fromJson(message['data']);
      print(response.body);
      print("checkNum : $message");

      emit(ShowPriceSuccess(showDetailsPriceStatic: showDetailsPriceStatic!));
    } else {
      var message = jsonDecode(response.body);
      print("book fail ${message['message']}");
      emit(ShowPriceFail(errMessage: message['message']));
    }
    return showDetailsPriceStatic;
  }
}
