import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/utils/app_customs.dart';
import 'package:flutter_svg/svg.dart';

class PhoneTextField extends StatelessWidget {
  final String? Function(String? value) validator;
  final int? maxLength;
  final TextEditingController controller;
  const PhoneTextField(
      {super.key,
      required this.validator,
      this.maxLength,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cep Telefonu Numaranız",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/turkish_flag.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "+90",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              validator: validator,
              keyboardType: TextInputType.number,
              maxLength: maxLength,
              decoration: const CustomInputDecoration(),
            ))
          ],
        ),
      ],
    );
  }
}
