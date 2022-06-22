import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_asset.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhiteColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Users", style: AppText.kAppbar),
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
          child: SingleChildScrollView(
            child: Container(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColor.kLightGreyColor, width: 0.5)),
                      ),
                      child: ListTile(
                        leading: Image(
                          image: AppAsset.imgProfile,
                          width: 49,
                          height: 49,
                        ),
                        title: Text(
                          "Firstname Lastname",
                          style: AppText.kTitle
                              .copyWith(color: AppColor.kBlackColor),
                        ),
                        subtitle: Text("email@email.com".toUpperCase(),
                            style: AppText.kSubtitle),
                      ),
                    );
                  }),
            ),
          ),
        ));
  }
}
