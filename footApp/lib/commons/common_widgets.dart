import 'package:flutter/material.dart';
import 'package:foot/commons/route/navigator_utils.dart';

class CommonWidgets {
  // static Widget gotoMainIcon(BuildContext context) {
  //   return IconButton(
  //     icon: const Icon(Icons.arrow_back, color: Colors.black),
  //     onPressed: () =>
  //         NavigatorUtils.push(context, MainRouter.homePage, clearStack: true),
  //   );
  // }

  static Widget goBack(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => NavigatorUtils.goBack(context),
    );
  }
}
