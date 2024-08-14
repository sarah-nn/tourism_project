import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';
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
      padding: const EdgeInsets.only(top: 16),
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
                topRight: Radius.circular(55))),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
                width: 0.8,
                color: light ? AppColor.primaryColor : Colors.white54),
            color: light
                ? AppColor.secondColor.withAlpha(150)
                : Color.fromARGB(255, 87, 86, 86),
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
                  Row(
                    children: [
                      const Text(
                        'Capacity Room : ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        '$num',
                        style: light
                            ? TextStyle(
                                fontSize: 16,
                                backgroundColor:
                                    Color.fromARGB(255, 200, 226, 247))
                            : TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      Text(
                        ' persons',
                        style: TextStyle(
                            fontSize: 16,
                            color: light ? Colors.black87 : Colors.white70),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Price : ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      Text("$price\$",
                          style: TextStyle(
                              backgroundColor: light
                                  ? Color.fromARGB(255, 238, 215, 214)
                                  : null,
                              fontSize: 16,
                              color: light
                                  ? null
                                  : const Color.fromARGB(255, 235, 135, 128))),
                      Text(
                        ' per day ',
                        style: TextStyle(
                          fontSize: 16,
                          color: light ? null : Colors.white70,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Num Room :',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
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
      ),
    );
  }
}
