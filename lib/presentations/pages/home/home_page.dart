import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_asset.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';
import 'package:suitmedia_app/presentations/widgets/button/primary_button.dart';
import 'package:suitmedia_app/shared/routers.dart';

class HomePage extends StatefulWidget {
  final String? name;
  const HomePage({Key? key, this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home", style: AppText.kAppbar),
          backgroundColor: AppColor.kWhiteColor,
          elevation: 0.5,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.kPrimaryColor,
              )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColor.kWhiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome',
                          style: AppText.kCaption,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.name ?? "John",
                          style: AppText.kBody,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Image(
                      image: AppAsset.imgProfile,
                      width: screenSize.width * 0.43,
                      height: screenSize.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 35),
                    Text("Select a user to show the profile",
                        style: AppText.kBodyDesc)
                  ],
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  Get.toNamed(Routers.users);
                },
                label: "Choose a User",
              )
            ],
          ),
        ));
  }
}
