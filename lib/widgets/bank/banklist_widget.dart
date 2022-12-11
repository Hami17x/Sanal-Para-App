import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/utils/colors.dart';

import '../../utils/app_customs.dart';
import '../../model/bank_model.dart';
import '../../view/bottom_sheet.dart';

class BankList extends StatelessWidget {
  final List<BankModel> liste;
  const BankList({super.key, required this.liste});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (BuildContext context, int index) {
          BankModel bank = liste[index];

          return InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                builder: (context) {
                  return BottomSheetPage(bank: bank, context: context);
                },
              );
            },
            child: Container(
              decoration: CustomBoxDecoraiton(10),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  DottedBorder(
                      color: Colors.black,
                      strokeWidth: 1,
                      dashPattern: const [
                        2,
                        2,
                      ],
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: Image.asset("assets/bank_logos/ziraat.png"))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          liste[index].bankName ?? "Unknown Bank",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: ProjectColors.instance.heiseBlack),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Havale/EFT ile para gönderin",
                          style: TextStyle(
                              fontSize: 10,
                              color: ProjectColors.instance.celestialGreen),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
