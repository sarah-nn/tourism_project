import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/global.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  //keys
  GlobalKey<FormState> formKeyLogin = GlobalKey();
  GlobalKey<FormState> formKeyReg = GlobalKey();

  //register
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  //login
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  login() async {
    if (formKeyLogin.currentState!.validate()) {
      emit(UserLoading());
      http.Response response =
          await http.post(Uri.parse(EndPoint.login), body: {
        'email': loginEmail.text,
        'password': loginPassword.text,
        'fcm_token': globalFcm
      }, headers: {
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        String token = message['token'];
        CacheHelper().saveData(key: 'token', value: token);
        print(message);
        emit(UserSuccess());
      } else {
        var message = jsonDecode(response.body);
        print(" message['message']${message['message']}");
        emit(UserFailure(message: message['message']));
      }
    } else {
      print("Not Valid");
    }
  }

  register() async {
    if (formKeyReg.currentState!.validate()) {
      emit(UserLoading());
      http.Response response =
          await http.post(Uri.parse(EndPoint.register), body: {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'password_confirmation': rePassword.text,
      }, headers: {
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        CacheHelper().saveData(key: "registerEmail", value: email.text);
        var message = jsonDecode(response.body);
        print(message);
        emit(UserSuccess());
      } else {
        var message = jsonDecode(response.body);
        print(message['message']);
        emit(UserFailure(message: message['message']));
      }
    } else {
      print("Not Valid");
    }
  }

  verifyCode(String code) async {
    emit(UserLoading());
    String myEmail = CacheHelper().getData(key: "registerEmail");
    http.Response response =
        await http.post(Uri.parse(EndPoint.verifyCodeSignup), body: {
      'email': myEmail,
      'code': code,
      'fcm_token': globalFcm
    }, headers: {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      if (message['message'] != 'worng code') {
        print(message);
        emit(UserSuccess());
      } else {
        var message = jsonDecode(response.body);
        print(message['message']);
        emit(UserFailure(message: message['message']));
      }
    } else {
      throw Exception("server or bad request error");
    }
  }

  logOut() async {
    var uri = Uri.parse(EndPoint.logOut);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(UserLoading());
      if (response.statusCode == 200) {
        print("logout message : ${response.body}");
        emit(UserLogOut());
      } else {
        var message = jsonDecode(response.body);
        print("api error${response.statusCode}=======${message}");
      }
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }
}
