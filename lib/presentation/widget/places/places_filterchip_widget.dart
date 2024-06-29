import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class FilterChipWidget extends StatefulWidget {
  final String categoryName;

  final String selectedCategory;
  final void Function() setStatFunction;

  const FilterChipWidget(
      {super.key,
      required this.categoryName,
      required this.selectedCategory,
      required this.setStatFunction});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        selectedColor: AppColor.primaryColor.withOpacity(0.8),
        backgroundColor: Colors.white12,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
                width: 1.2, color: AppColor.primaryColor.withOpacity(0.8))),
        label: Text(
          widget.categoryName,
          style: MyTextStyle.headers
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        selected: widget.selectedCategory == widget.categoryName,
        onSelected: (isSelected) {
          widget.setStatFunction();
        },
      ),
    );
  }
}
