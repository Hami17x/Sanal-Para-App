import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/utils/app_customs.dart';
import 'package:flutter_sanalira_app/model/bank_model.dart';
import 'package:flutter_sanalira_app/utils/colors.dart';
import 'package:flutter_sanalira_app/utils/snackbar.dart';

class BottomSheetPage extends StatelessWidget with CustomSnackBar {
  final BankModel bank;
  final BuildContext context;
  const BottomSheetPage({super.key, required this.bank, required this.context});

  final String text1 =
      "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.";
  final String text2 =
      "Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.";

  void copyText() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 4,
              width: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: CustomBoxDecoraiton(5, color: Colors.grey)),
          _customContainer("Hesap Adı", bank.bankAccountName ?? " Unknown"),
          _customContainer("IBAN", bank.bankIban ?? "Unknown"),
          _customContainer("Açıklama", bank.descriptionNo ?? "Unknown"),
          _customContainer2(text1, Colors.black),
          _customContainer2(text2, Colors.red)
        ],
      ),
    );
  }

  Widget _customContainer2(String text, Color color) {
    return Container(
      width: double.infinity,
      decoration: CustomBoxDecoraiton(5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 10),
      ),
    );
  }

  Widget _customContainer(String title, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 10, color: ProjectColors.instance.celestialGreen),
        ),
        Container(
          decoration: CustomBoxDecoraiton(5),
          margin: const EdgeInsets.only(top: 5, bottom: 15),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          //height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 12,
                    color: ProjectColors.instance.heiseBlack,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pop(context);
                    copiedTextSnackBar(text, context, title);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.green,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
