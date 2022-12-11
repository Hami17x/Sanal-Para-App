import 'package:flutter/material.dart';
import '../../utils/app_customs.dart';

class MoneyContainer extends StatelessWidget {
  const MoneyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomBoxDecoraiton(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(5),
      child: ListTile(
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        leading: Image.asset(
          "assets/icons/turkish_flag.png",
        ),
        title: const Text("Türk Lirası"),
        subtitle: const Text("TL"),
        trailing: const Text("234 ₺"),
      ),
    );
  }
}
