import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/presentation/widget/static_trip/check_static_book_widget.dart';

class PriceAndBookButtom extends StatelessWidget {
  final String price;
  const PriceAndBookButtom({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.primaryColor, width: 2.5),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "$price\n/ Person",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 17),
                ),
              )),
          const SizedBox(width: 10),
          Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CheckStaticBookWidget();
                      });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.primaryColor),
                  child: Text(
                    "Book Now",
                    style: MyTextStyle.Audiowide.copyWith(
                        fontSize: 19, color: Colors.white, letterSpacing: 1.5),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
