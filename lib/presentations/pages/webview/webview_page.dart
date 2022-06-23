import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:suitmedia_app/presentations/widgets/appbar/default_appbar.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppbar(title: ""),
        body: SafeArea(
            child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse("https://suitmedia.com/")),
        )));
  }
}
