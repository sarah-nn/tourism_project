import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/presentation/widget/starting_page/forsted_glassbox_widget.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  late Color mycolor;
  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: mycolor,
              image: DecorationImage(
                  image: const AssetImage(AppImage.starting2),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.red.withOpacity(0.9), BlendMode.dstATop))),
          alignment: Alignment.center,
        ),
        Positioned(
            bottom: 150,
            right: 23,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ForstedGlassBox(
                    blur: 4.0,
                    isBorder: true,
                    theWidth: 360.0,
                    theHeight: 430.0,
                    theChild: Container(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Explore.",
                            style: MyTextStyle.poppins
                                .copyWith(color: Colors.white, fontSize: 60),
                          ),
                          Text(
                            "Travel. \n Inspire.",
                            style: MyTextStyle.poppins.copyWith(
                                fontSize: 60,
                                color: const Color.fromARGB(255, 40, 67, 97)),
                          ),
                          const Text(
                            "   Life is all about journey \n   Find Yours.",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 21,
                                color: Color.fromARGB(255, 65, 64, 64)),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 390,
                  right: 155,
                  child: SizedBox(
                    height: 77,
                    width: 77,
                    child: FloatingActionButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () {
                        replace(context, AppRoutes.onBoarding);
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 196, 196, 196),
                      ),
                    ),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
