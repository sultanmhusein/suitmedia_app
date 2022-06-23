import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/data/models/users_response_model.dart';
import 'package:suitmedia_app/presentations/theme/app_asset.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';
import 'package:suitmedia_app/presentations/widgets/appbar/default_appbar.dart';
import 'package:suitmedia_app/presentations/widgets/button/primary_button.dart';
import 'package:suitmedia_app/presentations/widgets/content/content_header.dart';
import 'package:suitmedia_app/presentations/widgets/content/content_user.dart';
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
            ? DefaultAppbar(title: "Home")
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
              ContentHeader(
                name: widget.name,
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
                        ? ContentUser(
                            onPressed: () {
                              Get.toNamed(Routers.webview);
                            },
                            avatar: users?.avatar,
                            firstName: users?.firstName,
                            lastName: users?.lastName,
                            email: users?.email,
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
