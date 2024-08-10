import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScaleTextOrIcon extends StatefulWidget {
  ScaleTextOrIcon(
      {@required this.icons,
      required this.icon,
      @required this.style,
      required this.text,
      super.key});
  String text;
  TextStyle? style;
  bool icon;
  IconData? icons;
  @override
  State<ScaleTextOrIcon> createState() => _ScaleTextOrIconState();
}

class _ScaleTextOrIconState extends State<ScaleTextOrIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.9, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: !widget.icon
          ? Text(widget.text, style: widget.style)
          : Icon(
              widget.icons,
              color: const Color.fromARGB(255, 243, 149, 143),
              size: 30,
            ),
    );
  }
}
