import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';

class TwoLineContainer extends StatelessWidget {
  final String title1;
  final String content1;
  final String title2;
  final String content2;
  const TwoLineContainer(
      {super.key,
      required this.title1,
      required this.content1,
      required this.title2,
      required this.content2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          // color: const Color.fromRGBO(232, 243, 255, 1),
          color:
              light ? AppColor.staticTripContainer : AppColor.secoundColorDark,
          border: Border(
            left: BorderSide(
                width: 5, color: AppColor.primaryColor.withOpacity(1.0)),
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "$title1 : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: light
                          ? Color.fromARGB(255, 26, 73, 112)
                          : Colors.white),
                ),
                Text(
                  content1,
                  style: const TextStyle(fontSize: 17),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "$title2 : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: light
                          ? Color.fromARGB(255, 26, 73, 112)
                          : Colors.white),
                ),
                Text(
                  content2,
                  style: TextStyle(
                      fontSize: 17, color: light ? null : Colors.white60),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
