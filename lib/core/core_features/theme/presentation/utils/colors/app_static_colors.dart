import 'package:flutter/material.dart';

abstract class AppStaticColors {
  static const Color primary = Color(0xFFC11718);
  static const Color toastColor = Color(0xFFC11718);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color lightBlack = Color(0xff333333);
  static const Color lightOrange = Color(0xfffe9654);
  static const Color greyShadow = Color(0xffD9D9D9);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF58b9f0);
  static const LinearGradient primaryIngredientColor = LinearGradient(
    colors: [Color(0xFFd74747), Color(0xFFC11718)],
    stops: [0, 1],
  );
}
