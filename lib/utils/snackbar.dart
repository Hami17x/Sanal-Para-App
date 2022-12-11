import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin CustomSnackBar {
  copiedTextSnackBar(String copiedText, BuildContext context, String title) {
    Clipboard.setData(ClipboardData(text: copiedText)).then((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            content: CustomSnackBarContent(title: title),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
    });
  }
}

class CustomSnackBarContent extends StatelessWidget {
  final String title;
  const CustomSnackBarContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(
        "$title copied to clipboard",
        textAlign: TextAlign.center,
      ),
    );
  }
}
