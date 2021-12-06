import 'package:flutter/material.dart';

class RouteNotFound extends StatefulWidget {
  const RouteNotFound({Key? key}) : super(key: key);

  @override
  _RouteNotFoundState createState() => _RouteNotFoundState();
}

class _RouteNotFoundState extends State<RouteNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("页面不存在"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          "页面找不到",
          style: TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
