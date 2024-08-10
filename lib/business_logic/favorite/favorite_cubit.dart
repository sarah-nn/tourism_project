import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/get_favorite_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<FavoriteModel> favoriteModel = [];
  Set<String> favoriteId = {};
  var data;

  Future<List<FavoriteModel>?> getFavorite() async {
    var uri = Uri.parse(EndPoint.getFavorite);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response = await http.get(uri, headers: header);
    try {
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body)['data'];
        // favoriteModel = data.map((e) => FavoriteModel.fromJson(e));
        favoriteModel =
            (data as List).map((e) => FavoriteModel.fromJson(e)).toList();

        for (var item in data) {
          favoriteId.add(item['place_id'].toString());
          print(item['place_id']);
        }

        emit(FavoriteSuccess(favoriteModel));
      } else {
        var message = json.decode(response.body);
        emit(FavoriteFailure(errMessage: message['message'].toString()));
        print("=========================api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
    }
    return favoriteModel;
  }

  Future<void> addFavorite(String id) async {
    var uri = Uri.parse(EndPoint.addFavorite);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response =
        await http.post(uri, headers: header, body: {'place_id': id});
    try {
      if (response.statusCode == 200) {
        print(response.body);
        var message = json.decode(response.body);
        emit(AddFavoriteSuccess(
          errMessage: message['message']!.toString(),
        ));
        //  favoriteId.add(id);

        print('sucess delet');
      } else {
        var message = json.decode(response.body);
        emit(AddFavoriteFailure(errMessage: message['message']!.toString()));
      }
    } catch (e) {
      emit(AddFavoriteFailure(errMessage: e.toString()));

      print("$e");
    }
  }

  Future<void> removeFavorite(String id) async {
    var uri = Uri.parse(EndPoint.deleteFavorite);
    var header = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    };
    var response =
        await http.post(uri, headers: header, body: {'place_id': id});
    try {
      if (response.statusCode == 200) {
        print(response.body);
        var message = json.decode(response.body);
        emit(RemoveFavoriteSuccess(
            errMessage: message['message']!.toString(),
            favoriteId: int.parse(id)));
        //  favoriteId.remove(id);

        print('sucess delet');
      } else {
        var message = json.decode(response.body);
        emit(RemoveFavoriteFailure(errMessage: message['message']!.toString()));
      }
    } catch (e) {
      emit(RemoveFavoriteFailure(errMessage: e.toString()));

      print("$e");
    }
  }
}
