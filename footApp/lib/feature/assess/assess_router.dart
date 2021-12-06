import 'package:fluro/fluro.dart';
import 'package:foot/commons/route/IRouter.dart';

import 'assess_list.dart';
import 'assess_task.dart';

class AssessRouter extends IRouter {
  static String assessListPage = "/page/student/student_assess_list";
  static String assessPage = "/page/student/student_assess_task";

  @override
  void initFluroRouter(FluroRouter fluroRouter) {
    fluroRouter.define(assessListPage,
        handler: Handler(handlerFunc: (_, params) {
      // String userName = params[StudentAssessTaskPage.bundleKeyUserName]?.first;
      // String times = params[LoginPage.bundleKeyTime]?.first;
      return const AssessListPage();
    }));

    fluroRouter.define(assessPage,
        handler: Handler(handlerFunc: (context, params) {
      final args = context!.settings!.arguments as Map;
      print('assessPage.params=$args');
      return AssessTaskPage(args);
    }));
  }
}
