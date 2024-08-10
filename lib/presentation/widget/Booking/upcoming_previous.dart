import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class UpcomingAndPreviousButton extends StatefulWidget {
  UpcomingAndPreviousButton(
      {required this.onTapPrevious,
      required this.onTapUpcoming,
      required this.colorButtonUpcoming,
      required this.colorTextUpcoming,
      required this.colorButtonPrevious,
      required this.colorTextPrevious,
      super.key});
  void Function() onTapUpcoming;
  void Function() onTapPrevious;
  Color colorButtonUpcoming;
  Color colorTextUpcoming;
  Color colorButtonPrevious;
  Color colorTextPrevious;
  @override
  State<UpcomingAndPreviousButton> createState() =>
      _UpcomingAndPreviousButtonState();
}

class _UpcomingAndPreviousButtonState extends State<UpcomingAndPreviousButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onTapUpcoming,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColor.secondColor,
                  Color.fromARGB(255, 133, 186, 247),
                  const Color(0xff9ce3f8),
                ]),
                color: widget.colorButtonUpcoming,
                borderRadius: BorderRadius.circular(10)),

            //  elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, top: 12, bottom: 12),
              child: Text(
                'UPCOMING',
                style: TextStyle(
                    color: widget.colorTextUpcoming,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onTapPrevious,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColor.secondColor,
                  const Color(0xff6daffa),
                  const Color(0xff9ce3f8),
                ]),
                color: widget.colorButtonPrevious,
                borderRadius: BorderRadius.circular(10)),
            // elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 23, right: 23, top: 12, bottom: 12),
              child: Text(
                'PREVIOUS',
                style: TextStyle(
                    color: widget.colorTextPrevious,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
