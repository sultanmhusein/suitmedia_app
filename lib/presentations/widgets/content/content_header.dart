import 'package:flutter/material.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class ContentHeader extends StatefulWidget {
  final String? name;

  ContentHeader({this.name});

  @override
  State<ContentHeader> createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Welcome',
                style: AppText.kCaption,
              )
            ],
          ),
          Row(
            children: [
              Text(
                widget.name ?? "John",
                style: AppText.kBody,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
