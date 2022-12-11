import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/utils/colors.dart';

class LoginColumn extends StatefulWidget {
  final VoidCallback loginFunction;
  const LoginColumn({super.key, required this.loginFunction});

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  bool? isCheckboxTicked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isCheckboxTicked,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onChanged: (value) {
                isCheckboxTicked = value;
                setState(() {});
              },
            ),
            Expanded(
              child: RichText(
                text:
                    const TextSpan(text: "Hesabınızı oluştururken ", children: [
                  TextSpan(
                      text: "sözleşme ve koşulları",
                      style: TextStyle(color: Colors.green)),
                  TextSpan(text: " kabul etmeniz gerekir.", style: TextStyle())
                ]),
              ),
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ProjectColors.instance.loginButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onPressed: isCheckboxTicked == true ? widget.loginFunction : null,
              child: const Text("Giriş yap")),
        )
      ],
    );
  }
}
