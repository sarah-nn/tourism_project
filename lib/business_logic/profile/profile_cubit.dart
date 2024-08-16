import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  GlobalKey<FormState> profileKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String userPosition = '';
  String errMessage = '';
  String image = '';

  Map<String, String> buildRequestBody() {
    Map<String, String> body = {};

    if (nameController.text != '') {
      body['name'] = nameController.text;
    }
    if (phoneNumber.text != '') {
      body['phone_number'] = phoneNumber.text;
    }

    if (userPosition != '') {
      body['position'] = userPosition;
    }

    return body;
  }

  getUserInfo() async {
    var data;
    var uri = Uri.parse(EndPoint.profile);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response = await http.get(uri, headers: header);
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body);
        emit(ProfileInfo(userInfo: UserInfoModel.fromJson(data['data'])));
      } else {
        var message = jsonDecode(response.body);
        print(
            "Profile api error with ${response.statusCode} and ${response.body}");
        emit(ProfileChangeFaliure(errMessage: message['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileChangeFaliure(errMessage: e.toString()));
    }
  }

  updateUserInfo() async {
    var data;
    Map<String, String> requestBody = buildRequestBody();
    var uri = Uri.parse(EndPoint.updateProfile);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response = await http.post(uri, headers: header, body: requestBody);
      if (response.statusCode == 200) {
        print(response.body);
        data = json.decode(response.body);
        errMessage = '';
        emit(ProfileInfo(userInfo: UserInfoModel.fromJson(data['data'])));
      } else {
        var message = jsonDecode(response.body);
        print(
            "Profile api error with ${response.statusCode}and ${message['message']}");
        errMessage = message['message'];
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileChangeFaliure(errMessage: e.toString()));
    }
  }

  deleteAccount() async {
    Map<String, String> requestBody = buildRequestBody();
    var uri = Uri.parse(EndPoint.deleteAccount);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response = await http.post(uri, headers: header, body: requestBody);
      if (response.statusCode == 200) {
        emit(DeleteAccountDone());
      } else {
        var message = jsonDecode(response.body);
        print(
            "Profile api error with ${response.statusCode}and ${message['message']}");
        errMessage = message['message'];
        emit(ProfileChangeFaliure(errMessage: errMessage));
      }
    } catch (e) {
      print(e.toString());
      emit(ProfileChangeFaliure(errMessage: e.toString()));
    }
  }
}
