import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_asset.dart';
import 'package:suitmedia_app/presentations/widgets/button/primary_button.dart';
import 'package:suitmedia_app/presentations/widgets/dialog/custom_dialog.dart';
import 'package:suitmedia_app/presentations/widgets/text_field/custom_text_field.dart';
import 'package:suitmedia_app/shared/routers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();
  String palindrome = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Image(
              image: AppAsset.bg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AppAsset.imgLogin,
                width: 116,
                height: 116,
              ),
              SizedBox(
                height: 60,
              ),
              CustomTextField(
                label: "Name",
                hint: "Name",
                controller: _nameController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "Palindrome",
                hint: "Palindrome",
                controller: _palindromeController,
              ),
              SizedBox(height: 12),
              PrimaryButton(
                onPressed: () {
                  isPalindrome(_palindromeController.text) == true
                      ? DialogUtils.showErrorDialog(message: "isPalindrome")
                      : DialogUtils.showErrorDialog(message: "not palindrome");
                },
                label: "check".toUpperCase(),
              ),
              PrimaryButton(
                onPressed: () {
                  Get.toNamed(Routers.home, arguments: [_nameController.text]);
                },
                label: "next".toUpperCase(),
              ),
            ],
          ),
        )
      ],
    ));
  }

  bool isPalindrome(String input) {
    String formattedInput = input.toLowerCase().replaceAll(' ', '');
    return formattedInput == formattedInput.split('').reversed.join();
  }
}
