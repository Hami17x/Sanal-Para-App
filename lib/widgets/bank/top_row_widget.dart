import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/provider/resource_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/app_customs.dart';

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: CustomBoxDecoraiton(10),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.arrow_back)),
        Row(
          children: [
            Container(
                decoration: CustomBoxDecoraiton(10),
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    const Icon(Icons.notifications),
                    Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ))
                  ],
                )),
            const SizedBox(
              width: 5,
            ),
            PopupMenuButton(
                child: Container(
                    decoration: CustomBoxDecoraiton(10),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.settings)),
                onSelected: (String item) {
                  switch (item) {
                    case "logout":
                      context.read<ResourceProvider>().logOut();
                      break;
                    default:
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem(
                          value: "logout",
                          child: Row(
                            children: const [
                              Text("Logout"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.logout),
                            ],
                          ))
                    ]),
          ],
        )
      ],
    );
  }
}
