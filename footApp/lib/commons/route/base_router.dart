import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/feature/assess/assess_router.dart';
import 'package:foot/feature/main_router.dart';
import 'package:foot/feature/mine/mine_router.dart';
import 'package:foot/feature/ranking/ranking_router.dart';

import 'IRouter.dart';
import 'route_not_found.dart';

class BaseRouter {
  static FluroRouter _fluroRouter = FluroRouter();

  static FluroRouter getRouter() {
    return _fluroRouter;
  }

  static void setRouter(FluroRouter router) {
    _fluroRouter = router;
  }

  static final List<IRouter> _mListRouter = [];
  static void registerConfigureRoutes(FluroRouter router) {
    if (router == null) {
      throw Exception("fluroRouter is null, please init router");
    }

    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext? context, Map<String, List<String>> parameters) {
      logger.d("页面没有注册，找不到该页面  ");
      return const RouteNotFound();
    });

    _mListRouter.clear();
    //添加模块路由
    _mListRouter.add(MainRouter());
    _mListRouter.add(RankingRouter());
    _mListRouter.add(AssessRouter());
    _mListRouter.add(MineRouter());

    // _mListRouter.add(TestRouter());

    for (var element in _mListRouter) {
      element.initFluroRouter(router);
    }
  }
}
