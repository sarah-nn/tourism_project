import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';

class OneLineContainer extends StatelessWidget {
  final String title;
  final String content;
  const OneLineContainer(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          //   color: Color.fromRGBO(232, 243, 255, 1),
          color:
              light ? AppColor.staticTripContainer : AppColor.secoundColorDark,
          // color: Color.fromARGB(255, 235, 235, 235),
          border: Border(
            left: BorderSide(width: 5, color: Color.fromARGB(255, 26, 73, 112)),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              "$title : ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color:
                      light ? Color.fromARGB(255, 26, 73, 112) : Colors.white),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
