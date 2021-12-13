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
  final Map stepData;

  const StepDataView(
      {Key? key,
      this.animationController,
      this.animation,
      required this.stepData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [
            Text(
              stepData['calories_nbr'] ?? '0',
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            const Text('卡路里',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold)),
          ]),
          // Column(children: const [
          //   Text(
          //     '120',
          //     style: TextStyle(
          //         fontSize: 26,
          //         color: Colors.lightBlue,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   Text('分钟',
          //       style: TextStyle(
          //           fontSize: 12,
          //           color: Colors.redAccent,
          //           fontWeight: FontWeight.bold)),
          // ]),
          Column(children: [
            Text(
              stepData['distance_nbr'] ?? '0',
              style: const TextStyle(
                  fontSize: 26,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
            ),
            const Text('公里',
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
