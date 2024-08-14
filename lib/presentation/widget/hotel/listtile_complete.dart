import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';

// ignore: must_be_immutable
class WidgetListTileComplete extends StatelessWidget {
  WidgetListTileComplete(
      {required this.enableIconButton,
      @required this.onTapIconButton,
      required this.enableIcon,
      required this.enableCenterText,
      this.icon,
      required this.text,
      required this.onTap,
      required this.selected,
      this.style,
      super.key,
      @required selectedColor});
  IconData? icon;
  void Function()? onTapIconButton;
  String text;
  bool selected;
  bool enableIcon;
  bool enableCenterText;
  TextStyle? style;
  bool enableIconButton;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: light ? AppColor.secondColor : AppColor.secoundColorDark,
        child: enableIcon
            ? ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                leading: enableIconButton
                    ? IconButton(
                        onPressed: onTapIconButton,
                        icon: Icon(
                          icon,
                          color: AppColor.thirdColor,
                          size: 28,
                        ))
                    : Icon(icon, color: AppColor.primaryColor),
                selected: selected,
                selectedColor: Colors.white,
                selectedTileColor: AppColor.primaryColor,
                title: enableCenterText
                    ? Center(
                        child: Text(
                          text,
                          style: style,
                        ),
                      )
                    : Text(
                        text,
                        style: style,
                      ),
                onTap: onTap)
            : ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                selected: selected,
                selectedColor: Colors.white,
                selectedTileColor: AppColor.primaryColor,
                title: enableCenterText
                    ? Center(
                        child: Text(
                          text,
                          style: style,
                        ),
                      )
                    : Text(
                        text,
                        style: style,
                      ),
                onTap: onTap));
  }
}
