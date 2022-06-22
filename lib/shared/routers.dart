import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:suitmedia_app/injection.dart';
import 'package:suitmedia_app/presentations/cubit/users_cubit.dart';
import 'package:suitmedia_app/presentations/pages/page.dart';

class Routers {
  static const String home = "/home";
  static const String login = "/login";
  static const String users = "/users";
  static const String webview = "/webview";

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: home, page: () => HomePage(name: Get.arguments[0])),
    GetPage(
        name: users,
        page: () => BlocProvider(
              create: (context) => locator<UsersCubit>(),
              child: UsersPage(),
            )),
    // GetPage(name: users, page: () => UsersPage()),
    GetPage(name: webview, page: () => WebviewPage()),
  ];
}
