import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/presentation/widget/profile/card_profile_info_widget.dart';
import 'package:tourism_project/presentation/widget/profile/top_with_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: const Column(
        children: [
          TopWithImage(),
          SizedBox(height: 5),
          // EditImage(),
          // SizedBox(height: 50),
          CardProfileInfo(),
        ],
      ),
    );
  }
}

PreferredSizeWidget profileAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    elevation: 0,
    actions: [
      TextButton(
          onPressed: () {
            replace(context, AppRoutes.homePage);
          },
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 15,
            ),
          ))
    ],
  );
}
