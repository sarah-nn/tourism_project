import 'dart:ui';

import 'package:flutter/material.dart';

class ForstedGlassBox extends StatelessWidget {
  ForstedGlassBox(
      {super.key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild,
      required this.isBorder,
      required this.blur});

  final double theWidth;
  final double theHeight;
  final Widget theChild;
  bool isBorder = false;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: isBorder
                      ? Border.all(color: Colors.white.withOpacity(0.5))
                      : null,
                  color: Colors.white.withOpacity(0.26)),
            ),
            Center(
              child: theChild,
            )
          ],
        ),
      ),
    );
  }
}
