import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class CustomListTile extends StatefulWidget {
  final String? avatar, firstName, lastName, email;
  final void Function() onPressed;

  CustomListTile(
      {this.avatar,
      this.firstName,
      this.lastName,
      this.email,
      required this.onPressed});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.kLightGreyColor, width: 0.5)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24.0,
            backgroundImage: NetworkImage(widget.avatar ?? ""),
            backgroundColor: Colors.transparent,
          ),
          title: Row(
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
          subtitle: Text(widget.email ?? "Email", style: AppText.kSubtitle),
        ),
      ),
    );
  }
}
