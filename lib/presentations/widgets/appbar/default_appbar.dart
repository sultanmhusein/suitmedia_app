import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  DefaultAppbar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title ?? "", style: AppText.kAppbar),
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
    );
  }
}
