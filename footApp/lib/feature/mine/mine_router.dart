import 'package:fluro/fluro.dart';
import 'package:foot/commons/route/IRouter.dart';
import 'package:foot/feature/contacts/contacts_list_page.dart';
import 'package:foot/feature/mine/personal_info_page.dart';
// import 'package:foot/feature/mine/personal_info_page.dart11';

class MineRouter extends IRouter {
  static String personalInfoPage = "/page/mine/personal_info_page";
  static String contactListPage = "/page/mine/contact_list_page";

  @override
  void initFluroRouter(FluroRouter fluroRouter) {
    fluroRouter.define(personalInfoPage,
        handler: Handler(handlerFunc: (_, params) {
      return const PersonalInfoPage();
    }));

    fluroRouter.define(contactListPage,
        handler: Handler(handlerFunc: (_, params) {
      return const ContactListPage();
    }));

    // fluroRouter.define(assessPage,
    //     handler: Handler(handlerFunc: (context, params) {
    //   final args = context!.settings!.arguments as Map;
    //   print('assessPage.params=$args');
    //   return AssessTaskPage(args);
    // }));
  }
}
