import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetAddAndMinus extends StatelessWidget {
  WidgetAddAndMinus({this.color, this.onTap, this.icon, super.key});
  void Function()? onTap;
  IconData? icon;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 14,
      child: Center(
        child: IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: Colors.white,
              size: 14,
            )),
      ),
    );
  }
}
