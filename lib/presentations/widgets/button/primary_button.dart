import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? label;
  final bool isDisabled;
  final void Function() onPressed;

  PrimaryButton({
    Key? key,
    this.width,
    this.height,
    this.label,
    this.isDisabled = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: width ?? screenSize.width,
      height: height ?? 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            primary: AppColor.kPrimaryColor, // background
            onPrimary: AppColor.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          label ?? 'Label',
          style: AppText.kLabel,
        ),
      ),
    );
  }
}
