import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/functions/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isonboardingvisited =
        CacheHelper().getData(key: "isonboardingvisited?") ?? false;
    if (isonboardingvisited == true) {
      delayedNavigate(context, AppRoutes.login);
    } else {
      delayedNavigate(context, AppRoutes.login);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DefaultTextStyle(
            style: MyTextStyle.splashLogoText.copyWith(fontSize: 52),
            child: AnimatedTextKit(
              displayFullTextOnTap: false,
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText("Tourism", speed: Duration(milliseconds: 80)),
              ],
              onTap: () {
                print("something");
              },
            ),
          ),
        )));
  }
}
