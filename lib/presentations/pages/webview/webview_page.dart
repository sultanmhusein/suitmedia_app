import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/theme/app_color.dart';
import 'package:suitmedia_app/presentations/theme/app_text.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("", style: AppText.kAppbar),
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
        body: SafeArea(
            child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse("https://suitmedia.com/")),
        )));
  }
}
