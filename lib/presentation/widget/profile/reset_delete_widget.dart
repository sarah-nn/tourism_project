import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';

class ResetAndDelete extends StatelessWidget {
  const ResetAndDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            goRoute(context, AppRoutes.resetpassword);
          },
          child: Text(
            "Reset Password",
            style: TextStyle(
                letterSpacing: 0.5, fontSize: 16, color: AppColor.primaryColor),
          ),
        ),
        Text(
          " | ",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
        InkWell(
          onTap: () {
            showAlertDialog(context,
                "Are you sure that you want to\ndelete your accont ?\n\n❗ You will loose all your data .\n");
          },
          child: Text(
            "Delete Account",
            style: TextStyle(
                letterSpacing: 0.5, fontSize: 16, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
