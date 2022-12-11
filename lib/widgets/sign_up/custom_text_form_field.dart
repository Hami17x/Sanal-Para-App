import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sanalira_app/utils/app_customs.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String? value) validator;
  final int? maxLength;
  final bool? obscureText;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.validator,
      this.maxLength,
      this.obscureText,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = true;

  void changeVisibility() {
    isHidden = !isHidden;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText == null ? false : isHidden,
            style: const TextStyle(color: Colors.white),
            maxLength: widget.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.white70,
            decoration: CustomInputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.obscureText != null
                  ? IconButton(
                      onPressed: changeVisibility,
                      icon: isHidden
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.white70,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.white70,
                            ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
