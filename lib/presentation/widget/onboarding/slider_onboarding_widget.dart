import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/static.dart';
import 'package:tourism_project/presentation/widget/onboarding/dot_boarding.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding(
      {super.key, required this.pageController, required this.onPageChanged});

  final PageController pageController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: onboardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 440,
                    width: 500,
                    //  Adjust the height as needed
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                        image: AssetImage(
                          onboardingList[index].image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          CacheHelper().saveData(
                              key: "isonboardingvisited?", value: true);
                          replace(context, AppRoutes.homePage);
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              DotOnBoarding(
                controller: pageController,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Text(
                  onboardingList[index].title!,
                  style: MyTextStyle.poppins.copyWith(fontSize: 31, height: 1),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onboardingList[index].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17),
                    )),
              )
            ],
          );
        });
  }
}
