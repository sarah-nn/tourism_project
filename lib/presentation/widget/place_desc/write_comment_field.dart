import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class WriteCommentField extends StatelessWidget {
  final String placeId;
  final void Function()? onPressed;
  final TextEditingController commentController;
  const WriteCommentField(
      {super.key,
      required this.placeId,
      required this.commentController,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  controller: commentController,
                                  decoration: InputDecoration(
                                      hintText: "  Write your Comment",
                                      hintStyle: MyTextStyle.headers.copyWith(
                                        color: AppColor.primaryColor
                                            .withAlpha(180),
                                        fontSize: 18,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: onPressed,
                                        icon: Icon(Icons.send,
                                            color: AppColor.primaryColor),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
            },
            child: customUseOfField()),
      ),
    );
  }
}

Widget customUseOfField() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: const Color.fromARGB(255, 238, 238, 238),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "  Write your Comment",
                style: MyTextStyle.headers.copyWith(
                    color: AppColor.primaryColor.withAlpha(180), fontSize: 18),
              ),
              Icon(
                Icons.send,
                color: AppColor.primaryColor,
              )
            ],
          ),
        ),
      ));
}
