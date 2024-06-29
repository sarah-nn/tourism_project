import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an Account ?",
          style: const TextStyle(fontSize: 14),
        ),
        InkWell(
          onTap: () {
            goRoute(context, AppRoutes.register);
          },
          child: Text(
            " Register",
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ),
      ],
    );
  }
}
