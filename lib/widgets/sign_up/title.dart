import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: const TextSpan(
                text: "SanaLira'ya ",
                style: TextStyle(color: Colors.green, fontSize: 16),
                children: [
              TextSpan(
                  text: "yeni üyelik.", style: TextStyle(color: Colors.white))
            ])),
        const Text(
          "Bilgilerinizi girip sözleşmeyi onaylayın.",
          style: TextStyle(color: Color(0xffCFD4DE), fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
