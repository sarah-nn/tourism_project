import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';

part 'change_wallet_state.dart';

class ChangeWalletCubit extends Cubit<ChangeWalletState> {
  ChangeWalletCubit() : super(ChangeWalletInitial());

  TextEditingController moneyController = TextEditingController();

  changeWallet(String amount) async {
    var data;
    var uri = Uri.parse(EndPoint.changeMony);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response =
          await http.post(uri, headers: header, body: {'money': amount});
      if (response.statusCode == 200) {
        String link = json.decode(response.body)['link'];
        print("--------link--------$link");
        emit(ChangeWalletSuccess(money: link));
      } else {
        var message = jsonDecode(response.body);
        print(
            "Profile api error with ${response.statusCode}and ${message['message']}");
        String errMessage = message['message'];
        emit(ChangeWalletFail(errMessage: errMessage));
      }
    } catch (e) {
      print(e.toString());
      emit(ChangeWalletFail(errMessage: e.toString()));
    }
  }
}
