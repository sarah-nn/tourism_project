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

  //   updateProfile() async {
  //   if (profileKey.currentState!.validate()) {
  //     emit(ProfileLoading());
  //     http.Response response =
  //         await http.post(Uri.parse(EndPoint.updateProfile), body: {
  //       'email': loginEmail.text,
  //       'password': loginPassword.text
  //     }, headers: {
  //       'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
  //       'Accept': 'application/json'
  //     });
  //     if (response.statusCode == 200) {
  //       var message = jsonDecode(response.body);
  //       print(message);
  //       emit(UserSuccess());
  //     } else {
  //       var message = jsonDecode(response.body);
  //       print(message['message']);
  //       emit(UserFailure(message: message['message']));
  //     }
  //   } else {
  //     print("Not Valid");
  //   }

  // }

  getUserInfo() async {
    var uri = Uri.parse(EndPoint.profile);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response = await http.get(uri, headers: header);
      print(response.body);
      var data = json.decode(response.body)['data'];
      emit(ProfileInfo(userInfo: UserInfoModel.fromJson(data)));
    } catch (e) {
      print(e.toString());
      emit(ProfileChangeFaliure(errMessage: e.toString()));
    }
  }
}
