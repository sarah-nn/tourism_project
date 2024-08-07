import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Payment",
            style: MyTextStyle.headers,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              child: Card(
                color: const Color.fromARGB(255, 231, 235, 238),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [const Text('use points'), Circular()],
                ),
              ),
            ),
            Container(
              child: const Row(
                children: [Icon(Icons.credit_card), Text("Wallet")],
              ),
            ),
            Container(
              child: Row(
                children: [Icon(Icons.credit_card), Text("Points")],
              ),
            ),
            Container(
              child: Row(
                children: [Icon(Icons.credit_card), Text("Stripe")],
              ),
            )
          ],
        )
        // Center(child: Circular()),
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
          mainLabelStyle: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
