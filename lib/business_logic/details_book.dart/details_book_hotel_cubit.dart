import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';
import '../../core/utils/end_point.dart';
part 'details_book_hotel_state.dart';

class DetailsBookHotelCubit extends Cubit<DetailsBookHotelState> {
  DetailsBookHotelCubit() : super(DetailsBookHotelInitial());
  var data1 = [];
  List<DetailsBookHotelModel> detailsBookHotel = [];
  ShowDetailsBookHotelModel? showDetailsBookHotel;
  String? message;
  Future<List<DetailsBookHotelModel>> getAllDetailsBookHotel() async {
    var uri = Uri.parse(EndPoint.detailsBookHotel);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsBookHotelLoading());
      if (response.statusCode == 200) {
        data1 = json.decode(response.body)['data'];
        detailsBookHotel = data1
            .map((e) => DetailsBookHotelModel.fromJson(e))
            .toList(growable: true);
        print(response.body);
        emit(DetailsBookHotelSuccess(detailsBookHotel));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      try {
        emit(DetailsBookHotelFailure(errMessage: e.toString()));
      } catch (e) {
        print("object");
      }
    }
    print(detailsBookHotel);
    return detailsBookHotel;
  }

  // Future<ShowDetailsBookHotelModel?> getAllShowDetailsBookHotel(
  //     String id) async {
  //   var uri = Uri.parse(EndPoint.showDetailsBookHotel + id);
  //   var header = {'Authorization': 'Bearer $myToken'};
  //   var response = await http.get(uri, headers: header);
  //   try {
  //     emit(DetailsBookHotelLoading());
  //     if (response.statusCode == 200) {
  //       print('=============${response.body}');

  //       var data2 = json.decode(response.body);
  //       showDetailsBookHotel = ShowDetailsBookHotelModel.fromJson(data2);
  //       print('=============${response.body}');
  //       emit(ShowDetailsBookHotelSuccess(showDetailsBookHotel!));
  //     } else {
  //       print(response.statusCode);
  //       print("api error${response.statusCode}");
  //     }
  //   } catch (e) {
  //     emit(DetailsBookHotelFailure(errMessage: e.toString()));
  //   }

  //   print(showDetailsBookHotel);
  //   return showDetailsBookHotel;
  // }

  // Future<void> deleteHotel(String id) async {
  //   var uri = Uri.parse(EndPoint.deleteBookinHotel + id);
  //   var header = {'Authorization': 'Bearer $myToken'};
  //   var response = await http.delete(uri, headers: header);
  //   try {
  //     emit(DetailsBookHotelLoading());
  //     if (response.statusCode == 200) {
  //       print('=============${response.body}');

  //       message = json.decode(response.body);
  //       print('=============${response.body}');
  //       emit(DeleteHotelSuccess(message: message!));
  //     } else {
  //       print(response.statusCode);
  //       print("api error${response.statusCode}");
  //     }
  //   } catch (e) {
  //     emit(DeleteHotelFailure(errMessage: e.toString()));
  //   }
  // }
}
