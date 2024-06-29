import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/static.dart';
import 'package:tourism_project/presentation/widget/onboarding/button_onboarding_widget.dart';
import 'package:tourism_project/presentation/widget/onboarding/slider_onboarding_widget.dart';

class OnBoardingScreens extends StatefulWidget {
  OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(children: [
              Expanded(
                flex: 6,
                child: CustomSliderOnBoarding(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  pageController: _pageController,
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                  child: Column(
                children: [
                  const Spacer(flex: 3),
                  currentIndex == onboardingList.length - 1
                      ? CustomButtonOnBoarding(
                          text: "Get Started",
                          onPressed: () {
                            replace(context, AppRoutes.register);
                          })
                      : CustomButtonOnBoarding(
                          text: "Continue",
                          onPressed: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 299),
                                curve: Curves.easeIn);
                          },
                        )
                ],
              ))
            ])
          ],
        )));
  }
}
