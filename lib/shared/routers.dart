import 'package:get/get.dart';
import 'package:suitmedia_app/presentations/pages/page.dart';

class Routers {
  static const String home = "/home";
  static const String login = "/login";
  static const String users = "/users";
  static const String webview = "/webview";

  List<GetPage> routers = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: users, page: () => UsersPage()),
    GetPage(name: webview, page: () => WebviewPage()),
  ];
}
