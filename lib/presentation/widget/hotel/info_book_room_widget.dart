import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/hotel/add_minus_widget.dart';

// ignore: must_be_immutable
class WidgetInfoBookRoom extends StatelessWidget {
  WidgetInfoBookRoom(
      {this.onTapAdd,
      this.onTapMinus,
      this.colorAdd,
      this.colorMinus,
      required this.num,
      required this.price,
      required this.numCapacity,
      super.key});
  String num;
  String price;
  int numCapacity = 0;
  Color? colorAdd;
  Color? colorMinus;
  void Function()? onTapMinus;
  void Function()? onTapAdd;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: AppColor.primaryColor),
          color: AppColor.secondColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(55),
              bottomRight: Radius.circular(55),
              topRight: Radius.circular(55)),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Capacity room : $num persons',
                  style: const TextStyle(fontSize: 16),
                ),
                // Text(
                //   'Price : $price per day',
                //   style: const TextStyle(fontSize: 16),
                // ),
                Row(
                  children: [
                    const Text(
                      'Price : ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text("$price\$",
                        style:
                            const TextStyle(color: Colors.red, fontSize: 16)),
                    const Text(
                      ' per day ',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'num :',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    WidgetAddAndMinus(
                      onTap: onTapMinus,
                      icon: Icons.horizontal_rule,
                      color: colorMinus,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$numCapacity',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    WidgetAddAndMinus(
                      onTap: onTapAdd,
                      icon: Icons.add,
                      color: colorAdd,
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
