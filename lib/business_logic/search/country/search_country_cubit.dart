import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tourism_project/core/utils/global.dart';

part 'search_country_state.dart';

class SearchCubit extends Cubit<SearchCountryState> {
  SearchCubit() : super(SearchInitial());

  void searchPlaces(String query) async {
    if (query.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(SearchLoading());

      try {
        final response = await http.post(
          Uri.parse('http://192.168.43.119:8000/api/user/search-for-country'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $myToken',
          },
          body: json.encode({'name': query}),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);
          final List<dynamic> results = responseData['data'];
          print(response.body);
          emit(SearchLoaded(results));
        } else {
          print(response.reasonPhrase);
          emit(SearchError('Error: ${response.reasonPhrase}'));
        }
      } catch (e) {
        print(e.toString());
        emit(SearchError('Error: $e'));
      }
    }
  }
}
