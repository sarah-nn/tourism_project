import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/database/cach_helper.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  GlobalKey<FormState> formKeyCheckEmail = GlobalKey();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  forgetPassword() async {
    if (formKeyCheckEmail.currentState!.validate()) {
      emit(ForgetpasswordLoading());
      http.Response response =
          await http.post(Uri.parse(EndPoint.checkemail), body: {
        'email': email.text,
      }, headers: {
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        var messageSuccess = jsonDecode(response.body);
        print(messageSuccess);
        if (messageSuccess['message'] != 'there is no email like this') {
          CacheHelper().saveData(key: "reSetPasswordEmail", value: email.text);
          emit(
              ForgetpasswordSuccess(messageSuccess: messageSuccess['meseage']));
        } else {
          var messageFail = jsonDecode(response.body);
          print(messageFail['message']);
          emit(ForgetpasswordFailure(messageFail: messageFail['message']));
        }
      } else {
        throw Exception("server or bad request error");
      }
    } else {
      print("Not Valid");
    }
  }

  reSetPassword(String? email) async {
    if (formKeyResetPassword.currentState!.validate()) {
      emit(ForgetpasswordLoading());
      // String myEmail = CacheHelper().getData(key: "reSetPasswordEmail");
      http.Response response =
          await http.post(Uri.parse(EndPoint.resetPassword), body: {
        'email': email == ''
            ? CacheHelper().getData(key: "reSetPasswordEmail")
            : email,
        'password': password.text,
        'password_confirmation': rePassword.text
      }, headers: {
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body);
        print(message);
        emit(ForgetpasswordSuccess(messageSuccess: message['message']));
      } else {
        var message = jsonDecode(response.body);
        print(message['message']);
        emit(ForgetpasswordFailure(messageFail: message['message']));
      }
    } else {
      print("Not Valid");
    }
  }
}
