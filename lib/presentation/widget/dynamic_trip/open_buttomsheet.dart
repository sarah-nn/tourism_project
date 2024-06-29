import 'package:flutter/material.dart';

class OpenButtomSheet {
  flightButtomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        enableDrag: true,
        showDragHandle: true,
        context: context,
        builder: (BuildContext ctx) {
          return ListView.builder(itemBuilder: (context, index) {
            return const ListTile(
              contentPadding: EdgeInsets.all(2),
              title: Text("Avaliable flight"),
              subtitle: Text("Monday 9,2024"),
            );
          });
        });
  }
}
