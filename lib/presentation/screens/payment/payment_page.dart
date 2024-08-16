import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tourism_project/business_logic/change_wallet/change_wallet_cubit.dart';
import 'package:tourism_project/business_logic/payment/payment_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/payment_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentModel? paymentModel;

  Future<void> goToSttrip(String link) async {
    final String stripLink = link;

    if (await canLaunch(stripLink)) {
      await launch(stripLink);
    } else {
      throw 'Could not launch $stripLink';
    }
  }

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
          resizeToAvoidBottomInset: true,
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
                icon: const Icon(
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
                        child: Row(
                          children: [
                            Text(
                              'my point : ',
                              style: MyTextStyle.bright.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 35,
                                  color: AppColor.primaryColor),
                            ),
                            // state is PaymentSuccess
                            //     ? Text(
                            //         "${paymentModel?.data?.point.toString()}")
                            //     : Center(
                            //         child: CircularProgressIndicator(),
                            //       )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      state is PaymentSuccess
                          ? Circular("${state.paymentModel.data?.point}")
                          : CircularProgressIndicator()
                    ],
                  ),
                ),
                strip(
                    Color.fromARGB(255, 236, 243, 255),
                    "Strip",
                    Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(AppImage.strip)),
                    ""),
                Row(
                  children: [
                    Expanded(
                      child: customPayCard(Color.fromARGB(255, 254, 249, 255),
                          "Wallet", "\$ ${paymentModel?.data?.money}"),
                    ),
                    Expanded(
                      child: customPayCard(Color.fromARGB(255, 255, 255, 238),
                          "My payment", "\$ ${paymentModel?.data?.payments}"),
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

  Widget strip(Color color, String test, Widget end, String val) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (BuildContext context) {
              TextEditingController myController = TextEditingController();
              return BlocProvider(
                create: (context) => ChangeWalletCubit(),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context)
                        .viewInsets
                        .bottom, // Adjust for keyboard
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(13),
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          Text(
                            "Enter Your Money To Change :",
                            style: MyTextStyle.headers.copyWith(fontSize: 30),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            autofocus: true,
                            controller: myController,
                            decoration: InputDecoration(
                                suffixIcon: BlocConsumer<ChangeWalletCubit,
                                    ChangeWalletState>(
                                  listener: (context, state) {
                                    if (state is ChangeWalletSuccess) {
                                      print("--------${state.money}");
                                      //  showAlertDialog(context, "done");
                                    } else if (state is ChangeWalletFail) {
                                      showAlertDialog(
                                          context, state.errMessage);
                                    }
                                  },
                                  builder: (context, state) {
                                    return IconButton(
                                        onPressed: () async {
                                          context
                                              .read<ChangeWalletCubit>()
                                              .changeWallet(myController.text);
                                          state is ChangeWalletSuccess
                                              ? await goToSttrip(state.money)
                                              : null;
                                        },
                                        icon: Icon(Icons.check));
                                  },
                                ),
                                hintText: "Enter Your Mone To Change .."),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Color.fromARGB(255, 248, 246, 246),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        test,
                        style: TextStyle(fontSize: 22),
                      ),
                      end
                    ],
                  ),
                  val != "" ? SizedBox(height: 15) : Container(),
                  Text(
                    val,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  val != '' ? SizedBox(height: 15) : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customPayCard(Color color, String test, String val) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Color.fromARGB(255, 248, 246, 246),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      test,
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
                val != "" ? SizedBox(height: 15) : Container(),
                Text(
                  val,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                val != '' ? SizedBox(height: 15) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Circular(String point) {
    return SleekCircularSlider(
      min: 0,
      max: 100,
      initialValue: double.parse(point),
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
