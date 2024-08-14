import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tourism_project/business_logic/payment/payment_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/payment_model.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late PaymentModel paymentModel;
  @override
  void initState() {
    super.initState();
    context.read<PaymentCubit>().getPaymentInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) {
      if (state is PaymentSuccess) {
        paymentModel = (state).paymentModel;
      }
      if (state is PaymentFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
              title: Text(
                "Payment",
                style: MyTextStyle.headers.copyWith(fontSize: 35),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'my point : ',
                          style: MyTextStyle.bright.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 35,
                              color: AppColor.primaryColor),
                        ),
                      ),
                      SizedBox(height: 5),
                      Circular()
                    ],
                  ),
                ),
                customPayCard(Color.fromARGB(255, 236, 243, 255), "Strip",
                    Image.asset(AppImage.strip)),
                Row(
                  children: [
                    Expanded(
                      child: customPayCard(
                          Color.fromARGB(255, 254, 249, 255),
                          "Wallet",
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              AppImage.wallet,
                              color: Colors.black45,
                            ),
                          )),
                    ),
                    Expanded(
                      child: customPayCard(
                          Color.fromARGB(255, 255, 255, 238),
                          "Point",
                          const Icon(
                            Icons.payments_outlined,
                            size: 47,
                            color: Colors.black45,
                          )),
                    ),
                  ],
                ),
                // customPayCard(Color.fromARGB(255, 236, 243, 255), "Strip",
                //     Image.asset(AppImage.strip))
              ],
            ),
          ));
    });
  }

  Widget customPayCard(Color color, String test, Widget end) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Color.fromARGB(255, 248, 246, 246),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  test,
                  style: TextStyle(fontSize: 22),
                ),
                end
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Circular() {
    return SleekCircularSlider(
      min: 0,
      max: 100,
      initialValue: 100,
      appearance: CircularSliderAppearance(
        size: 230,
        customColors: CustomSliderColors(
          trackColor: const Color(0xffc2dffc),
          progressBarColors: [
            AppColor.secondColor,
            const Color(0xff9ba7f3),
            const Color(0xff6daffa),
            const Color(0xff9ce3f8),
          ],
        ),
        infoProperties: InfoProperties(
          mainLabelStyle: const TextStyle(
              fontSize: 45,
              fontFamily: 'normal',
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
      ),
    );
  }
}
