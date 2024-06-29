import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class WidgetListTileComplete extends StatelessWidget {
  WidgetListTileComplete(
      {required this.enableIcon,
      required this.enableCenterText,
      this.icon,
      required this.text,
      required this.onTap,
      required this.selected,
      this.style,
      super.key});
  IconData? icon;
  String text;
  bool selected;
  bool enableIcon;
  bool enableCenterText;
  TextStyle? style;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: AppColor.secondColor,
        child: enableIcon
            ? ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                leading: Icon(
                  icon,
                  color: AppColor.primaryColor,
                ),
                selected: selected!,
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
                selected: selected!,
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
