import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';

showAlertDialog(BuildContext context, String message) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: SizedBox(
      height: 300,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/false.png",
            ),
            const Text(
              "Oops...",
              style: TextStyle(
                  // fontFamily: 'normal',
                  color: Color.fromARGB(251, 244, 82, 82),
                  fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: WidgetElevatedButton(
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'OK',
              ),
            )
          ]),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showBookingDoneDialog(BuildContext context, path, id) {
  Dialog alert = Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(colors: [
            AppColor.secondColor.withOpacity(0.2),
            Colors.white,
            AppColor.secondColor.withOpacity(0.2)
          ])),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(AppImage.checkMark)),
              SizedBox(width: 8),
              Expanded(
                child: AnimatedTextKit(
                  displayFullTextOnTap: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText("Congrats !",
                        textStyle: MyTextStyle.poppins.copyWith(
                            color: AppColor.primaryColor,
                            fontSize: 28,
                            //letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                        speed: const Duration(milliseconds: 65)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            "Booking Complete Successfuly ... Enjoy your trip !",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                height: 1.5,
                fontFamily: 'normal',
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    id != 'id'
                        ? GoRouter.of(context)
                            .push('/bookingDynamicDetails/${id}')
                        : context.pop();
                  },
                  child: Text(
                    "View details",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15),
                  )),
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 15),
                  )),
            ],
          )
        ],
      ),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget noSearchResult() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: Image.asset(AppImage.noResult),
      ),
      const SizedBox(height: 20),
      Text(
        "No Result",
        style: MyTextStyle.poppins
            .copyWith(color: const Color(0xff9E9E9E), fontSize: 20),
      )
    ],
  );
}

void goRoute(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}

void replace(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void delayedNavigate(BuildContext context, String path) {
  Future.delayed(const Duration(seconds: 2), () {
    replace(context, path);
  });
}

showAlertSuccess(
    BuildContext context, String message, String buttomTitle, String path) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppImage.success),
        const SizedBox(height: 20),
        const Text(
          "congratulations! ",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 2),
        ),
        const SizedBox(height: 8),
        Text(
          "successfully $message",
          // style: const TextStyle(fontSize: 19),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white),
            onPressed: () {
              replace(context, path);
            },
            child: Text(buttomTitle))
      ],
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

CustomAlertDialog(
  BuildContext context,
  final String title,
  final String message,
  final String positiveBtnText,
  final String negativeBtnText,
  final Function onPostivePressed,
  final Function onNegativePressed,
) {
  AlertDialog alert = AlertDialog(
    title: title != null ? Text(title) : null,
    content: message != null ? Text(message) : null,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          if (onNegativePressed != null) {
            onNegativePressed();
          }
          print("negattttttive ${negativeBtnText}");
        },
        child: Text(
          negativeBtnText,
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      MaterialButton(
        onPressed: () {
          if (onPostivePressed != null) {
            onPostivePressed();
          }
          print("posittttttive ${positiveBtnText}");
        },
        child: Text(
          positiveBtnText,
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
