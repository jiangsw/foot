import 'package:fluro/fluro.dart';
import 'package:foot/commons/route/IRouter.dart';
import 'package:foot/feature/home/home.dart';
import 'login/login_page.dart';

class MainRouter extends IRouter {
  static String loginPage = "/page/login/login_page";
  // static String homePage = "/page/home/home_page";
  static String homeScreen = "/page/home/home";

  @override
  void initFluroRouter(FluroRouter fluroRouter) {
    fluroRouter.define(loginPage, handler: Handler(handlerFunc: (_, params) {
      return LoginPage();
    }));

    fluroRouter.define(homeScreen, handler: Handler(handlerFunc: (_, params) {
      // return HomePage();
      return const HomeScreen();
    }));
  }
}
