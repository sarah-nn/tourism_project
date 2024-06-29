import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_value_model.dart';

part 'dynamic_trip_state.dart';

class DynamicTripCubit extends Cubit<DynamicTripState> {
  DynamicTripCubit() : super(DynamicTripInitial());

  TextEditingController tripName = TextEditingController();
  List<String> triplist = [];
  String tripNameVal = '';
  String startDate = '';
  String endDate = '';

  void addToTripList(String keyName, String value) {
    keyName = value;
  }

  void printList() {
    print("1.$gtripname \n");
    print("1.$gstartDate \n");
    print("1.$gendDate jkwdj \n");
  }
}
