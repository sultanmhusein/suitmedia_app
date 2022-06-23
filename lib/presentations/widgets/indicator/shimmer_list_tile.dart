import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
            decoration: BoxDecoration(
                color: AppColor.kGreyColor,
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.fromLTRB(18, 0, 18, 10),
          );
        });
  }
}
