import 'dart:convert';
import 'dart:core';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foot/commons/declare.dart';

class StepLineView extends StatefulWidget {
  // final AnimationController? animationController;
  // final Animation<double>? animation;

  final String? spotData;

  const StepLineView({Key? key, this.spotData}) : super(key: key);

  @override
  _StepLineViewState createState() => _StepLineViewState();
}

class _StepLineViewState extends State<StepLineView> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // final List<FlSpot> spotList;

//? 是否可触摸
  final bool enableLineTouchData = true;
//? 是否显示网格线
  final bool showGridData = false;
//? 是否显示底边坐标
  final bool showBottomTitles = true;
//? 是否显示边框
  final bool showBorderData = false;
  //? 是否显示底部边框
  final bool showBottomBorder = true;
  //? 是否显示侧边边框
  final bool showLeftBorder = false;
//? 是否显示左侧坐标
  final bool showlLeftTitles = false;
//? 是否显示左侧标题
  final bool showAxisLeftTitle = false;
//? 是否显示底部标题
  final bool showAxisBottomTitle = false;
//? 第一条线是否是曲线
  final bool isCurved1 = true;
  //? 第二条线是否显示数据点
  final bool showDotData2 = false;
  //? 粉线是否显示线下区域
  final bool showBelowBarData = true;
  //? 绿线是否显示线下区域
  final bool showAboveBarData = false;
  //? 蓝线线头是圆头还是方头
  final bool isStrokeCapRound = true;

  List<FlSpot> getSpotList() {
    List<FlSpot> list = [];

    // logger.d(spotData);

    List spotList = json.decode(widget.spotData!);

    for (var element in spotList) {
      // logger.d(element);
      FlSpot spot = FlSpot(double.parse(element['x'].toString()),
          double.parse(element['y'].toString()));
      list.add(spot);
    }

    // logger.d(list);

    return list;
  }

  int getX() {
    List spotList = json.decode(widget.spotData!);
    return spotList.length;
    // return double.parse(spotList.length.toString());
  }

  double getY() {
    List spotList = json.decode(widget.spotData!);

    double y = 0.0;

    for (var element in spotList) {
      double yy = double.parse(element['y'].toString());

      if (y < yy) {
        y = yy;
      }
    }
    return y;
  }

  @override
  Widget build(BuildContext context) {
    getSpotList();
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 20),
      child: SizedBox(
        height: 400,
        child: LineChart(
          sampleData(),
        ),
      ),
    );
  }

  // LineChartData mainData() {
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: false,
  //       drawVerticalLine: true,
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: false,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         getTextStyles: (context, value) => const TextStyle(
  //             color: Color(0xff68737d),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16),
  //         getTitles: (value) {
  //           if (value.toInt() % 2 == 0) {
  //             return value.toInt().toString() + '月';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (context, value) => const TextStyle(
  //           color: Color(0xff67727d),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return '10k';
  //             case 3:
  //               return '30k';
  //             case 5:
  //               return '50k';
  //           }
  //           return '';
  //         },
  //         reservedSize: 28,
  //         margin: 12,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: false,
  //         border: Border.all(color: const Color(0xff37434d), width: 1)),
  //     minX: 0,
  //     maxX: 11,
  //     minY: 0,
  //     maxY: 6,
  //     lineBarsData: linesBarData1(),
  //   );
  // }

  // List<LineChartBarData> linesBarData1() {
  //   final LineChartBarData lineChartBarData1 = LineChartBarData(
  //     spots: [
  //       FlSpot(0, 3),
  //       FlSpot(2.6, 2),
  //       FlSpot(4.9, 5),
  //       FlSpot(6.8, 3.1),
  //       FlSpot(8, 4),
  //       FlSpot(9.5, 3),
  //       FlSpot(11, 4),
  //     ],
  //     isCurved: true,
  //     colors: const [Color(0x444af699)],
  //     barWidth: 5,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(
  //       show: false,
  //     ),
  //     belowBarData: BarAreaData(
  //       show: true,
  //       colors: [const Color(0x33aa4cfc)],
  //       // colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
  //     ),
  //   );
  //   return [lineChartBarData1];
  // }

  LineChartData sampleData() {
    return LineChartData(
      //? 是否可以点击
      lineTouchData: LineTouchData(
        enabled: enableLineTouchData,
      ),
      //? 网格线配置
      gridData: FlGridData(
        show: showGridData,
      ),
      axisTitleData: _buildFlAxisTitleData(),
      //? 标题
      titlesData: _buildTitles(),
      //? 边框
      borderData: _buildBorderData(),
      minX: 0,
      maxX: getX().toDouble(),
      maxY: getY(),
      minY: 0,
      //? 线条数据
      lineBarsData: linesBarDatas(),
    );
  }

  //? 标题配置
  FlAxisTitleData _buildFlAxisTitleData() {
    return FlAxisTitleData(
      leftTitle: AxisTitle(titleText: "侧轴标题", showTitle: showAxisLeftTitle),
      bottomTitle: AxisTitle(titleText: "底部标题", showTitle: showAxisBottomTitle),
      rightTitle: AxisTitle(titleText: '', showTitle: false),
    );
  }

  //? 坐标配置
  FlTitlesData _buildTitles() {
    return FlTitlesData(
      //? 下边标题
      show: true,
      bottomTitles: _buildBottomTitle(),
      //? 左侧标题
      leftTitles: _buildLeftTitle(),
      topTitles: _buildTopTitle(),
      rightTitles: _buildRightTitle(),
    );
  }

  //? 底部坐标配置
  SideTitles _buildBottomTitle() {
    return SideTitles(
      showTitles: showBottomTitles,
      //? 标题下面空间，如果不预留，可能与下面控件重合
      reservedSize: 12,
      getTextStyles: (BuildContext context, value) {
        return const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
      },
      margin: 2,
      getTitles: (value) {
        // logger.d('title.value=${value.toInt()}');
        if (value.toInt() > 0) {
          return value.toInt().toString();
        } else {
          return '';
        }

        // switch (value.toInt()) {
        //   case 1:
        //     return '1';
        //   case 2:
        //     return '2';
        //   case 3:
        //     return '3';
        //   case 4:
        //     return '4';
        //   case 5:
        //     return '5';
        //   case 6:
        //     return '6';
        //   case 7:
        //     return '7';
        //   case 8:
        //     return '8';
        //   case 9:
        //     return '9';
        //   case 10:
        //     return '10';
        //   case 11:
        //     return '11';
        //   case 12:
        //     return '12';
        // }
        // return '';
      },
    );
  }

  //? 左侧坐标配置
  SideTitles _buildLeftTitle() {
    return SideTitles(
      showTitles: showlLeftTitles,
      interval: 2,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff75729e),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '1m';
          case 2:
            return '2m';
          case 3:
            return '3m';
          case 4:
            return '5m';
          case 5:
            return '6m';
        }
        return '';
      },
      margin: 8,
      reservedSize: 30,
    );
  }

  //? top侧坐标配置
  SideTitles _buildTopTitle() {
    return SideTitles(
      showTitles: false,
      interval: 2,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff75729e),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      getTitles: (value) {
        // switch (value.toInt()) {
        //   case 1:
        //     return '1m';
        //   case 2:
        //     return '2m';
        //   case 3:
        //     return '3m';
        //   case 4:
        //     return '5m';
        //   case 5:
        //     return '6m';
        // }
        return '';
      },
      margin: 8,
      reservedSize: 30,
    );
  }

  //? top侧坐标配置
  SideTitles _buildRightTitle() {
    return SideTitles(
      showTitles: false,
      interval: 2,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff75729e),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      getTitles: (value) {
        return '';
      },
      margin: 8,
      reservedSize: 30,
    );
  }

  //? 边框信息
  FlBorderData _buildBorderData() {
    return FlBorderData(
        show: showBorderData,
        border: Border(
          bottom: showBottomBorder
              ? const BorderSide(
                  color: Color(0xff4e4965),
                  width: 4,
                )
              : const BorderSide(
                  color: Colors.transparent,
                ),
          left: showLeftBorder
              ? const BorderSide(
                  color: Color(0xff4e4965),
                  width: 2,
                )
              : const BorderSide(
                  color: Colors.transparent,
                ),
          right: const BorderSide(
            color: Colors.transparent,
          ),
          top: const BorderSide(
            color: Colors.transparent,
          ),
        ));
  }

  //? 三条线的配置
  List<LineChartBarData> linesBarDatas() {
    return [
      // 绿线
      // LineChartBarData(
      //   //? 取样点
      //   spots: [
      //     FlSpot(1, 1),
      //     FlSpot(3, 4),
      //     FlSpot(5, 1.8),
      //     FlSpot(7, 5),
      //     FlSpot(10, 2),
      //     FlSpot(12, 2.2),
      //     FlSpot(13, 1.8),
      //   ],
      //   //? 是否是曲线
      //   isCurved: isCurved1,
      //   // curveSmoothness: 0,
      //   colors: const [
      //     Color(0x444af699),
      //   ],
      //   //? 线的宽度
      //   barWidth: 4,
      //   //? 线头是否是圆形
      //   isStrokeCapRound: true,
      //   //? 是否显示数据点
      //   dotData: FlDotData(
      //     show: false,
      //   ),
      //   //? 是否显示线上区域
      //   aboveBarData: BarAreaData(show: showAboveBarData, colors: [
      //     const Color(0x444af699),
      //   ]),
      // ),
      // 粉线
      LineChartBarData(
        spots: getSpotList(),
        isCurved: true,
        // curveSmoothness: 0,
        isStepLineChart: false,
        colors: gradientColors,
        barWidth: 4,
        isStrokeCapRound: isStrokeCapRound,
        dotData: FlDotData(
          show: showDotData2,
        ),
        belowBarData: BarAreaData(
          show: showBelowBarData,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
      // 蓝线
      // LineChartBarData(
      //   spots: [
      //     FlSpot(1, 3.8),
      //     FlSpot(3, 1.9),
      //     FlSpot(6, 5),
      //     FlSpot(10, 3.3),
      //     FlSpot(13, 4.5),
      //   ],
      //   isCurved: true,
      //   curveSmoothness: 0,
      //   colors: const [
      //     Color(0x4427b6fc),
      //   ],
      //   barWidth: 2,
      //   isStrokeCapRound: true,
      //   dotData: FlDotData(show: true),
      //   belowBarData: BarAreaData(
      //     show: false,
      //   ),
      // ),
    ];
  }
}
