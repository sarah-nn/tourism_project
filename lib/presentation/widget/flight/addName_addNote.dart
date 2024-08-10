import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class AddNameAndNote extends StatefulWidget {
  AddNameAndNote(
      {required this.onSubmittedName,
      required this.onSubmittedNote,
      super.key});
  Function(String) onSubmittedName;
  Function(String) onSubmittedNote;

  @override
  State<AddNameAndNote> createState() => _AddNameAndNoteState();
}

class _AddNameAndNoteState extends State<AddNameAndNote> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'If you wante name booking :',
                        style: TextStyle(
                            fontFamily: 'BrightDiamondPersonalUseOnl-OV2Ze',
                            fontSize: 22),
                      ),
                      TextField(
                        autofocus: true,
                        onSubmitted: widget.onSubmittedName,
                      )
                    ],
                  );
                }));
              });
        },
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: AppColor.primaryColor,
            ),
            const Text(
              ' add name booking',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontFamily: 'normal',
                  fontSize: 18),
            )
          ],
        ),
      ),
      const VerticalDivider(
        thickness: 3.2,
        width: 2,
      ),
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'If you wante add note booking :',
                        style: TextStyle(
                            fontFamily: 'BrightDiamondPersonalUseOnl-OV2Ze',
                            fontSize: 20),
                      ),
                      TextField(
                          autofocus: true, onSubmitted: widget.onSubmittedNote)
                    ],
                  );
                }));
              });
        },
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: AppColor.primaryColor,
            ),
            const Text(
              ' add note booking',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontFamily: 'normal',
                  fontSize: 18),
            )
          ],
        ),
      ),
    ]);
  }
}
