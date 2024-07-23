import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomSearch extends StatelessWidget {
  final String title;
  final void Function()? onPressedIcon;
  final TextEditingController myController;
  const CustomSearch({
    super.key,
    required this.title,
    this.onPressedIcon,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 53,
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: title,
                  hintStyle:
                      TextStyle(fontSize: 18, color: AppColor.primaryColor),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 230, 230, 230),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Container(
            height: 53,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 62,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(Icons.search, size: 32, color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
