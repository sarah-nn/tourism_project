import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';

showAlertDialog(BuildContext context, String message) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Warning",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
    content: Text(
      message,
      style: const TextStyle(
          fontFamily: "normal", fontSize: 20, fontWeight: FontWeight.bold),
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
