import 'package:flutter/material.dart';

extension StringExtensions on String {
  Color getColorFromHex() {
    // this method converts "#66CC78" to Color(0xff66CC78)
    var hex = "0xff${substring(1)}";
    var hexNumber = int.parse(hex);
    return Color(hexNumber);
  }
}
