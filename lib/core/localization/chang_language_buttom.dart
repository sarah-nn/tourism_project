import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tourism_project/core/localization/changlocal.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class ChangLanguageButtom extends GetView<LocaleController> {
  const ChangLanguageButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              height: 50,
              onPressed: () {
                controller.changeLang("ar");
              },
              color: AppColor.secondColor,
              child: Text("Arabic"),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: MaterialButton(
              height: 50,
              onPressed: () {
                controller.changeLang("en");
              },
              color: AppColor.secondColor,
              child: Text("English"),
            ),
          )
        ],
      ),
    );
  }
}
