import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaceAction extends StatelessWidget {
  const PlaceAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.65),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_rounded))),
      ],
    );
  }
}
