import 'package:flutter/material.dart';

abstract class MyTextStyle {
  static const splashLogoText = TextStyle(
      fontSize: 40,
      fontFamily: "SonsieOne",
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const headers = TextStyle(
      //  height: 2.5,
      fontWeight: FontWeight.bold,
      fontSize: 40,
      fontFamily: 'Philosopher',
      color: Colors.black);

  static const poppins = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      fontFamily: 'Poppins',
      color: Colors.black);

  static const Pacifico =
      TextStyle(fontSize: 42, fontFamily: 'Pacifico', color: Colors.black);

  static const Audiowide = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      fontFamily: 'Audiowide',
      color: Colors.black);

  static const normal =
      TextStyle(fontSize: 30, fontFamily: 'normal', color: Colors.black);

  static const bright = TextStyle(
      fontSize: 30,
      fontFamily: 'BrightDiamondPersonalUseOnl-OV2Ze',
      color: Colors.black);
}
