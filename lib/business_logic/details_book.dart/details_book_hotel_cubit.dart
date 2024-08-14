import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import '../../core/utils/end_point.dart';
part 'details_book_hotel_state.dart';

class DetailsBookHotelCubit extends Cubit<DetailsBookHotelState> {
  DetailsBookHotelCubit() : super(DetailsBookHotelInitial());
  var data1 = [];
  DetailsBookHotelModel? detailsBookHotel;
  String? message;
  Future<DetailsBookHotelModel?> getAllDetailsBookHotel() async {
    var uri = Uri.parse(EndPoint.detailsBookHotel);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(DetailsBookHotelLoading());
      if (response.statusCode == 200) {
        print(response.body);

        var data = json.decode(response.body);
        detailsBookHotel = DetailsBookHotelModel.fromJson(data);
        emit(DetailsBookHotelSuccess(detailsBookHotel!));
      } else {
        print("api error${response.statusCode}");
        print(response.body);
      }
    } catch (e) {
      print('hhhhhhhhhh$e');
      try {
        emit(DetailsBookHotelFailure(errMessage: e.toString()));
      } catch (e) {
        print("object");
      }
    }
    print(detailsBookHotel);
    return detailsBookHotel;
  }
}



// class DetailsBookHotelCubit extends Cubit<DetailsBookHotelState> {
//   DetailsBookHotelCubit() : super(DetailsBookHotelInitial());
//   var data1 = [];
//   List<DetailsBookHotelModel> detailsBookHotel = [];
//   ShowDetailsBookHotelModel? showDetailsBookHotel;
//   String? message;
//   Future<List<DetailsBookHotelModel>> getAllDetailsBookHotel() async {
//     var uri = Uri.parse(EndPoint.detailsBookHotel);
//     var header = {'Authorization': 'Bearer $myToken'};
//     var response = await http.get(uri, headers: header);
//     try {
//       emit(DetailsBookHotelLoading());
//       if (response.statusCode == 200) {
//         data1 = json.decode(response.body)['data'];
//         detailsBookHotel = data1
//             .map((e) => DetailsBookHotelModel.fromJson(e))
//             .toList(growable: true);
//         print(response.body);
//         emit(DetailsBookHotelSuccess(detailsBookHotel));
//       } else {
//         print("api error${response.statusCode}");
//       }
//     } catch (e) {
//       try {
//         emit(DetailsBookHotelFailure(errMessage: e.toString()));
//       } catch (e) {
//         print("object");
//       }
//     }
//     print(detailsBookHotel);
//     return detailsBookHotel;
//   }

// }
