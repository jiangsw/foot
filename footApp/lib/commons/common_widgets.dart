import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foot/commons/route/navigator_utils.dart';

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14);
}

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

  static showSnackBar(String text, BuildContext context,
      {Color color = Colors.blue}) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
