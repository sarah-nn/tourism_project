import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/payment_model.dart';
import '../../core/utils/end_point.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  PaymentModel? paymentModel;
  Future<PaymentModel?> getPaymentInfo() async {
    var uri = Uri.parse(EndPoint.paymentInfo);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(PaymentLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        paymentModel = PaymentModel.fromJson(data);
        print(response.body);
        emit(PaymentSuccess(paymentModel!));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      try {
        emit(PaymentFailure(errMessage: e.toString()));
      } catch (e) {
        print(e);
      }
    }
    print(paymentModel);
    return paymentModel;
  }
}
