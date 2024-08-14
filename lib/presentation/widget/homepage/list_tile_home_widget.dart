import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';

// ignore: must_be_immutable
class widgetListTile extends StatelessWidget {
  widgetListTile(
      {required this.icon, required this.text, this.onTap, super.key});
  IconData icon;
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: light ? AppColor.primaryColor : AppColor.iconsColorDark,
      ),
      title: Text(text),
      onTap: onTap,
    );
  }
}
