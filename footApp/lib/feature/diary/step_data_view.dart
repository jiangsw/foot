import 'package:flutter/material.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/main.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/circle_painter.dart';
import 'dart:math' as math;

import 'package:percent_indicator/circular_percent_indicator.dart';

class StepDataView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const StepDataView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: const [
            Text(
              '423',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            Text('卡路里',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
          ]),
          Column(children: const [
            Text(
              '120',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            Text('分钟',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
          ]),
          Column(children: const [
            Text(
              '12.1',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            Text('公里',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
          ]),
        ],
      ),
    );
  }
}
