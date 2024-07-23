import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/functions/functions.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final String textone;
  final String texttwo;
  final String routeName;

  const AlreadyHaveAnAccount(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: const TextStyle(fontSize: 14),
        ),
        InkWell(
          onTap: () {
            print("[[[[[[[[[[object]]]]]]]]]]");
            replace(context, routeName);
          },
          child: Text(
            texttwo,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ],
    );
  }
}
