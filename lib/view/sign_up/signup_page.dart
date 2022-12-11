import 'package:flutter/material.dart';
import 'package:flutter_sanalira_app/model/user_model.dart';
import 'package:flutter_sanalira_app/provider/resource_provider.dart';
import 'package:flutter_sanalira_app/utils/colors.dart';
import 'package:flutter_sanalira_app/utils/validation_manager.dart';
import 'package:flutter_sanalira_app/widgets/sign_up/login_column.dart';
import 'package:flutter_sanalira_app/widgets/sign_up/custom_text_form_field.dart';
import 'package:flutter_sanalira_app/widgets/sign_up/header.dart';
import 'package:flutter_sanalira_app/widgets/sign_up/phone_text_form_field.dart';
import 'package:flutter_sanalira_app/widgets/sign_up/title.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _mailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      context.read<ResourceProvider>().signin(UserModel(
          adSoyad: _nameController.text.trim(),
          mail: _mailController.text.trim(),
          phone: _phoneController.text.trim()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/background_image.png",
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color(0xFF141C2D).withOpacity(0.75),
            const Color(0xFF626772).withOpacity(0.75),
          ])),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SafeArea(child: _body(context)),
          ),
        ),
      ],
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 1, child: HeaderWidget()),
        Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: ProjectColors.instance.blueBlack,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitleWidget(),
                            CustomTextField(
                              controller: _nameController,
                              title: "Ad Soyad",
                              hintText: "Eşref İban",
                              validator: (value) => ValidationManager.instance
                                  .validateName(value),
                            ),
                            CustomTextField(
                              controller: _mailController,
                              title: "E-posta",
                              hintText: "esrefyasa@monegon.com",
                              validator: (value) => ValidationManager.instance
                                  .validateEmail(value),
                            ),
                            CustomTextField(
                                controller: _passwordController,
                                title: "Parola",
                                hintText: "123456",
                                validator: (value) => ValidationManager.instance
                                    .validatePassword(value),
                                obscureText: true),
                            PhoneTextField(
                              controller: _phoneController,
                              validator: (value) => ValidationManager.instance
                                  .validateMobile(value),
                              maxLength: 20,
                            ),
                            LoginColumn(loginFunction: login),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
