import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/global.dart';

// ignore: must_be_immutable
class CardCategouries extends StatelessWidget {
  CardCategouries(
      {required this.image,
      required this.nameCategory,
      required this.path,
      super.key});
  String image;
  String nameCategory;
  String path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("===================${myToken}");
            goRoute(context, path);
          },
          child: Container(
            decoration: BoxDecoration(
                color: light
                    ? AppColor.secondColor.withOpacity(0.9)
                    : AppColor.secoundColorDark,
                border: Border.all(width: 2, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(50)),
            height: 90,
            width: 90,
            child: Center(
              child: SvgPicture.asset(
                image,
                color: light ? AppColor.primaryColor : AppColor.iconsColorDark,
                height: 50,
              ),
              // child: Icon(
              //   icon,
              //   color: AppColor.primaryColor,
              //   size: 28,
              // ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "${nameCategory}",
          style: TextStyle(
              fontSize: 16, color: light ? Colors.black : Colors.white),
        ),
      ],
    );
  }
}
