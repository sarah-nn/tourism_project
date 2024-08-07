import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/place_country_model.dart';
import 'package:tourism_project/data/models/places_depend_on_category_model.dart';
import 'package:tourism_project/data/models/places_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit() : super(PlacesInitial());

  var data = [];
  List<Place> placeList = [];
  List<PlaceDependOnCategoryModel> place_category_list = [];
  List<Map<String, dynamic>> placesCountry = [];

  List<Place> places_country = [];

  Future<List<Place>> getAllPlace() async {
    var uri = Uri.parse(EndPoint.places);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(PlacesLoading());
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body)['data'];
        placeList = data.map((e) => Place.fromJson(e)).toList(growable: true);
        return placeList;
        // emit(PlacesSuccess(placelist: placeList));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("exception in ");
      emit(PlacesFailure(errMessage: e.toString()));
    }
    print(placeList);
    return placeList;
  }

  Future<List<Map<String, dynamic>>> placeFromCountry(String countryId) async {
    final url = Uri.parse(EndPoint.placeRealtedToCountry + countryId);
    var header = {'Authorization': 'Bearer $myToken'};
    final response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final placesData = jsonData['data']['area_places'];
      for (var areaPlace in placesData) {
        final areaPlaces = areaPlace['places'];
        for (var place in areaPlaces) {
          placesCountry.add({
            'id': place['id'],
            'name': place['name'],
          });
        }
      }
      emit(CountryPlacesSuccess(placesCountry));
      return placesCountry; // Emit the fetched places
    } else {
      print('Request failed with status: ${response.statusCode}');
      return [];
    }
  }

  Future<List<dynamic>> getAllCategory() async {
    var header = {'Authorization': 'Bearer $myToken'};
    final response =
        await http.get(Uri.parse(EndPoint.allCategory), headers: header);
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      print(response.body);
      // print("api error ${response.statusCode} ==== ${response.body}");
    }
    return [];
  }

  Future<PlaceResponse> placesDependOnCountry(String tripDestinationId) async {
    var header = {'Authorization': 'Bearer $myToken'};
    final response = await http.get(
        Uri.parse(EndPoint.placeRealtedToCountry + tripDestinationId),
        headers: header);

    if (response.statusCode == 200) {
      print(response.body);
      var myresponse =
          PlaceResponse.fromJson(jsonDecode(response.body)['data']);
      return myresponse;
    } else {
      //emit(PlacesFailure(errMessage: e.toString()))
      throw Exception('Failed to load data');
    }
  }

  Future<List<PlaceDependOnCategoryModel>> placeDependOnCategory(
      int categoryId) async {
    var uri = Uri.parse(EndPoint.placeDependOnCategory + categoryId.toString());
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(PlacesLoading());
      if (response.statusCode == 200) {
        data = json.decode(response.body)['data'];
        place_category_list.clear();
        for (var category in data) {
          for (var place in category['places']) {
            place_category_list.add(PlaceDependOnCategoryModel.fromJson(place));
          }
        }
        print(response.body);
        emit(PlacesSuccess(placesCategory: place_category_list));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print(data);
      print("exception in place depend on category\n $e");

      emit(PlacesFailure(errMessage: e.toString()));
    }
    print(place_category_list);
    return [];
  }
}
