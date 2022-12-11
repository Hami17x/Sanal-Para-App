import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/sanalira_icon.png"),
        const SizedBox(
          width: 5,
        ),
        const Text(
          "SanaLira",
          style: TextStyle(color: Colors.white, fontSize: 21),
        )
      ],
    ));
  }
}
