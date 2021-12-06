import 'package:flutter/material.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/main.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/circle_painter.dart';
import 'dart:math' as math;

import 'package:percent_indicator/circular_percent_indicator.dart';

class StepNumberView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const StepNumberView({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomPainter(
          //   Painter: MyPainter(
          //       completeColor: Colors.red,
          //       completeWidth: 10,
          //       completePercent: 20),
          // ),

          CircularPercentIndicator(
            radius: 240.0,
            animation: true,
            animationDuration: 2400,
            lineWidth: 8.0,
            percent: 0.4,
            center: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "2930步\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
                children: <TextSpan>[
                  TextSpan(
                    text: '40%',
                    style: TextStyle(color: Color(0xFF008EFF), fontSize: 28),
                  )
                ],
              ),
            ),
            // footer: Text(
            //   Strings.myDairyStepToDay,
            //   style:
            //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
            // ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.blueGrey,
            progressColor: Colors.red,
          ),
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 8.0,
          //   animation: true,
          //   percent: 0.72,
          //   center: const Text(
          //     "72.0%",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   footer: Text(
          //     Strings.myDairyStepWeek,
          //     style:
          //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   circularStrokeCap: CircularStrokeCap.square,
          //   progressColor: Colors.red,
          // ),
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 8.0,
          //   animation: true,
          //   percent: 0.83,
          //   center: const Text(
          //     "83.0%",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   footer: Text(
          //     Strings.myDairyStepMonth,
          //     style:
          //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   circularStrokeCap: CircularStrokeCap.round,
          //   progressColor: Colors.red,
          // ),
          // CircularPercentIndicator(
          //   radius: 80.0,
          //   lineWidth: 8.0,
          //   animation: true,
          //   percent: 0.5,
          //   center: const Text(
          //     "50.0%",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   footer: Text(
          //     Strings.myDairyStepYear,
          //     style:
          //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          //   ),
          //   circularStrokeCap: CircularStrokeCap.round,
          //   progressColor: Colors.red,
          // ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
