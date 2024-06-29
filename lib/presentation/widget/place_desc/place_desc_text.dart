import 'package:flutter/material.dart';

class PlaceDescText extends StatefulWidget {
  final String text;
  final int maxWords;

  const PlaceDescText({Key? key, required this.text, required this.maxWords})
      : super(key: key);

  @override
  State<PlaceDescText> createState() => _PlaceDescTextState();
}

class _PlaceDescTextState extends State<PlaceDescText> {
  bool isExpanded = false;

  String get truncatedText {
    final words = widget.text.split(' ');
    if (words.length <= widget.maxWords) {
      return widget.text;
    } else {
      return words.sublist(0, widget.maxWords).join(' ') + '  ...  ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: const TextStyle(
                color: Color.fromARGB(255, 116, 116, 116),
                height: 1.6,
                fontSize: 17),
            text: isExpanded ? widget.text : truncatedText,
          ),
          WidgetSpan(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => setState(() => isExpanded = !isExpanded),
              child: Text(isExpanded ? '  Read Less' : 'Read More'),
            ),
          ),
        ],
      ),
    );
  }
}
