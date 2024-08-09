import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/notes_model.dart';

class AllNotesCard extends StatelessWidget {
  const AllNotesCard({super.key, required this.model});
  final NotesModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  model.tripName!,
                  style: MyTextStyle.normal.copyWith(
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontSize: 21),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  model.tripNote!,
                  style: const TextStyle(fontSize: 19),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 214, 214),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  children: [
                    const Text(
                      "Type : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("${model.type!} note")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
