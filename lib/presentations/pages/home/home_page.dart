import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/data/models/users_response_model.dart';
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
  late User? users;

  @override
  void initState() {
    super.initState();
    setState(() {
      users = User();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: users?.id == null
            ? AppBar(
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
              )
            : AppBar(
                title: Text(""),
                elevation: 0,
                backgroundColor: AppColor.kWhiteColor,
                leading: null,
                automaticallyImplyLeading: false,
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
                    users?.avatar != null
                        ? CircleAvatar(
                            radius: 82.0,
                            backgroundImage: NetworkImage(
                              users?.avatar ?? "",
                            ),
                            backgroundColor: Colors.transparent,
                          )
                        : Image(
                            image: AppAsset.imgProfile,
                            width: screenSize.width * 0.43,
                            height: screenSize.width * 0.43,
                            fit: BoxFit.contain,
                          ),
                    SizedBox(height: 35),
                    users?.firstName != null &&
                            users?.lastName != null &&
                            users?.email != null
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    users?.firstName ?? "First Name",
                                    style: AppText.kTitle
                                        .copyWith(color: AppColor.kBlackColor),
                                  ),
                                  Text(" "),
                                  Text(
                                    users?.lastName ?? "Last Name",
                                    style: AppText.kTitle
                                        .copyWith(color: AppColor.kBlackColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(users?.email ?? "email",
                                      style: AppText.kBodyDesc),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routers.webview);
                                    },
                                    child: Text("website",
                                        style: AppText.kBodyDesc.copyWith(
                                            color: AppColor.kPrimaryColor,
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                ],
                              )
                            ],
                          )
                        : Text("Select a user to show the profile",
                            style: AppText.kBodyDesc),
                  ],
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  Get.toNamed(
                    Routers.users,
                  )?.then((value) {
                    if (value != null) {
                      setState(() {
                        users = value;
                      });
                    }
                  });
                },
                label: "Choose a User",
              )
            ],
          ),
        ));
  }
}
