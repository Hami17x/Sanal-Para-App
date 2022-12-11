import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/provider/resource_provider.dart';
import 'package:flutter_sanalira_app/utils/colors.dart';
import 'package:flutter_sanalira_app/widgets/bank/banklist_widget.dart';
import 'package:flutter_sanalira_app/widgets/bank/error_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../widgets/bank/money_container_widget.dart';
import '../../widgets/bank/top_row_widget.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  final String text = "Türk lirası yatırmak için banka seçiniz.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.instance.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopRow(),
              const MoneyContainer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  text,
                  style:
                      TextStyle(color: ProjectColors.instance.celestialGreen),
                ),
              ),
              _futureBuilder(context),
            ],
          ),
        ),
      ),
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  FutureBuilder<void> _futureBuilder(BuildContext context) {
    return FutureBuilder(
      future: context.watch<ResourceProvider>().getBanks(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return BankList(liste: snapshot.data);
        }
        if (snapshot.hasError) {
          return ProjectErrorWidget(
            retry: () {
              setState(() {});
            },
          );
        }
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
        color: ProjectColors.instance.bottomAppbarColor,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/bottom_bar/hut.svg",
              ),
              SvgPicture.asset(
                "assets/bottom_bar/transaction.svg",
              ),
              const SizedBox(), //dummy container
              SvgPicture.asset(
                "assets/bottom_bar/layer_1.svg",
              ),
              SvgPicture.asset(
                "assets/bottom_bar/user.svg",
              ),
            ],
          ),
        ));
  }

  Padding _floatingButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(0.7, -0.5),
            end: Alignment(0.6, 0.5),
            colors: [
              Color(0xFF252741),
              Color(0xFF26293B),
            ],
          ),
        ),
        height: 55,
        width: 55,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {},
          child: Center(
            child: SvgPicture.asset(
              "assets/bottom_bar/layer_2.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
