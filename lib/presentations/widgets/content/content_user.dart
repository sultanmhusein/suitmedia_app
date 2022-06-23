import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class ContentUser extends StatefulWidget {
  final String? avatar, firstName, lastName, email;
  final void Function() onPressed;

  ContentUser(
      {this.avatar,
      this.firstName,
      this.lastName,
      this.email,
      required this.onPressed});

  @override
  State<ContentUser> createState() => _ContentUserState();
}

class _ContentUserState extends State<ContentUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.firstName ?? "First Name",
              style: AppText.kTitle.copyWith(color: AppColor.kBlackColor),
            ),
            Text(" "),
            Text(
              widget.lastName ?? "Last Name",
              style: AppText.kTitle.copyWith(color: AppColor.kBlackColor),
            ),
          ],
        ),
        SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.email ?? "email", style: AppText.kBodyDesc),
            GestureDetector(
              onTap: widget.onPressed,
              child: Text("website",
                  style: AppText.kBodyDesc.copyWith(
                      color: AppColor.kPrimaryColor,
                      decoration: TextDecoration.underline)),
            ),
          ],
        )
      ],
    );
  }
}
