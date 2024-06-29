import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomSearch extends StatelessWidget {
  final String title;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconfavorite;
  const CustomSearch(
      {super.key,
      required this.title,
      this.onPressedIcon,
      this.onPressedSearch,
      required this.onPressedIconfavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 44),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: AppColor.primaryColor,
                  ),
                  onPressed: onPressedSearch,
                ),
                hintText: title,
                hintStyle:
                    TextStyle(fontSize: 20, color: AppColor.primaryColor),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                filled: true,
                fillColor: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 62,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: const Icon(Icons.favorite_outline,
                  size: 32, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
