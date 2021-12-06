import 'package:fluro/fluro.dart';
import 'package:foot/commons/route/IRouter.dart';
import 'motion_ranking_view.dart';

class RankingRouter extends IRouter {
  static String motionRankingPage = "/page/ranking/motion_ranking";

  @override
  void initFluroRouter(FluroRouter fluroRouter) {
    fluroRouter.define(motionRankingPage,
        handler: Handler(handlerFunc: (_, params) {
      return const MotionRankingPage();
    }));
  }
}
