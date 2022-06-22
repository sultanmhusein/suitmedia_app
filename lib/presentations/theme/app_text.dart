import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';

class AppText {
  static TextStyle get kTitle => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kGreyColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.24);

  static TextStyle get kSubtitle => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kGreyColor,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 1.15);

  static TextStyle get kLabel => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kWhiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.21);

  static TextStyle get kAppbar => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kPrimaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.27);

  static TextStyle get kCaption => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.36);

  static TextStyle get kBody => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kBlackColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 1.36);

  static TextStyle get kBodyDesc => const TextStyle(
      fontFamily: 'Poppins',
      color: AppColor.kDarkGreyColor,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 1.36);
}
