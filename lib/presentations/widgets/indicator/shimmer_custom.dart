import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';

enum ShimmerType { cardGrid, cardlist }

class ShimmerCustom extends StatelessWidget {
  const ShimmerCustom({
    Key? key,
    required this.child,
    this.direction = ShimmerDirection.ltr,
  }) : super(key: key);
  final Widget child;
  final ShimmerDirection direction;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: direction,
      period: Duration(milliseconds: 1200),
      baseColor: AppColor.kLightGreyColor,
      child: child,
      highlightColor: AppColor.kWhiteColor,
    );
  }
}
