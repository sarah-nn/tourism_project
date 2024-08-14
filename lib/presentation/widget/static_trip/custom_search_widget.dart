import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';

class CustomSearch extends StatefulWidget {
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
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
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
                controller: widget.myController,
                decoration: InputDecoration(
                  hintText: widget.title,
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: light ? AppColor.primaryColor : Colors.white70),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: light
                      ? const Color.fromARGB(255, 230, 230, 230)
                      : AppColor.secoundColorDark,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Container(
            height: 53,
            decoration: BoxDecoration(
                color: light
                    ? Color.fromARGB(255, 230, 230, 230)
                    : AppColor.secoundColorDark,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 62,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: widget.onPressedIcon,
              icon: Icon(Icons.search,
                  size: 32,
                  color: light ? AppColor.primaryColor : Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
