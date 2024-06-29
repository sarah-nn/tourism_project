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
  int price;
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
        height: 140,
        decoration: BoxDecoration(
          color: AppColor.secondColor.withAlpha(130),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
              topRight: Radius.circular(45)),
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
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Price : $price per day',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
