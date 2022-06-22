import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';
import 'package:suitmedia_app/presentations/widgets/button/primary_button.dart';

class DialogUtils {
  static void showErrorDialog(
      {required String message,
      String label = "Close",
      String? header,
      VoidCallback? onPressed}) {
    Get.defaultDialog(
        barrierDismissible: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        backgroundColor: AppColor.kWhiteColor,
        radius: 6,
        title: header ?? "Information",
        titleStyle: AppText.kBody,
        content: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppText.kBodyDesc,
          ),
        ),
        actions: [
          PrimaryButton(
            onPressed: onPressed ??
                () {
                  Get.back();
                },
            label: label,
          )
        ]);
  }
}
