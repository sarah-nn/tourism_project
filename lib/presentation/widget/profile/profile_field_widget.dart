import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class ProfileField extends StatelessWidget {
  final String title;
  final String userInfo;
  final bool index;
  const ProfileField(
      {super.key,
      required this.title,
      required this.userInfo,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Icon(
              Icons.edit_rounded,
              color: AppColor.primaryColor,
            )
          ],
        ),
        Text(
          userInfo,
          style: MyTextStyle.normal
              .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        index
            ? const Divider(
                height: 35,
                thickness: 2,
                color: Color.fromARGB(255, 196, 196, 196))
            : Container()
      ],
    );
  }
}
