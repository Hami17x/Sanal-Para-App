import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/extensions/string_extensions.dart';

class ProjectColors {
  ProjectColors._();
  static final instance = ProjectColors._();
  final Color blueBlack = const Color(0xFF252D3D).withOpacity(0.5);
  final Color loginButtonColor = "#66CC78".getColorFromHex();
  final Color bottomAppbarColor = Colors.white;
  final Color boxColor = Colors.white;
  final Color scaffoldBackgroundColor = const Color(0xFFF3F4F6);
  final Color celestialGreen = const Color(0xFFCFD4DE);
  final Color heiseBlack = const Color(0xff141C2D);
}
