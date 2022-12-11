import 'package:flutter/material.dart';

class CustomBoxDecoraiton extends BoxDecoration {
  CustomBoxDecoraiton(double radius, {Color color = Colors.white})
      : super(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        );
}

class CustomText extends Text {
  CustomText(String text, {super.key, double fontSize = 12})
      : super(text, style: TextStyle(fontSize: fontSize));
}

class CustomFormFieldBorder extends OutlineInputBorder {
  const CustomFormFieldBorder()
      : super(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ));
}

class CustomInputDecoration extends InputDecoration {
  const CustomInputDecoration({String? hintText, Widget? suffixIcon})
      : super(
          counterText: "",
          border: const CustomFormFieldBorder(),
          enabledBorder: const CustomFormFieldBorder(),
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38),
          suffixIcon: suffixIcon,
        );
}
