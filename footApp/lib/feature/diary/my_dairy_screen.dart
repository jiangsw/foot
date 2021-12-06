import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/feature/diary/step_data_view.dart';
import 'package:foot/feature/diary/step_line_view.dart';
import 'package:foot/feature/diary/step_number_view.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/gradual_change_view.dart';
import 'package:huawei_health/huawei_health.dart';

enum LogOptions { call, success, error, custom }

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  late DataController _dataController;

  var spotListJson =
      '[{"x": 1, "y": 2344},{"x": 2, "y": 1231},{"x": 3, "y": 2353},{"x": 4, "y": 5679},{"x": 5, "y": 2325},{"x": 6, "y": 2479},{"x": 7, "y": 4597},{"x": 8, "y": 3896},{"x": 9, "y": 6907},{"x": 10, "y": 4975},{"x": 11, "y": 3547},{"x": 12, "y": 2956},{"x": 13, "y": 6542},{"x": 14, "y": 6734},{"x": 15, "y": 3258}]';
  // AnimationController? animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    // addAllListData();
    init();
    super.initState();
  }

  void getSpotList() {}

  init() async {
    if (!mounted) return;
    // Initialize Event Callbacks
    // AutoRecorderController.autoRecorderStream.listen(_onAutoRecorderEvent);
    // Initialize a DataController
    initDataController();
  }

  void initDataController() async {
    if (!mounted) return;
    // log('init', _dataTextController, LogOptions.call);
    logger.d('init ', LogOptions.call);
    try {
      _dataController = await DataController.init(<HiHealthOption>[
        HiHealthOption(DataType.DT_CONTINUOUS_STEPS_DELTA, AccessType.read),
        HiHealthOption(DataType.DT_CONTINUOUS_STEPS_DELTA, AccessType.write),
        HiHealthOption(DataType.DT_INSTANTANEOUS_HEIGHT, AccessType.read),
        HiHealthOption(DataType.DT_INSTANTANEOUS_HEIGHT, AccessType.write),
        HiHealthOption(DataType.DT_CONTINUOUS_CALORIES_BURNT, AccessType.read),
        HiHealthOption(DataType.DT_CONTINUOUS_DISTANCE_DELTA, AccessType.read),
      ]);
      // log('init', _dataTextController, LogOptions.success);
      logger.d('init ', LogOptions.success);
    } on PlatformException catch (e) {
      logger.d('init ', LogOptions.error);
      // log('init', _dataTextController, LogOptions.error, error: e.message!);
    }
  }

  // void addAllListData() {
  //   // const int count = 4;

  //   // listViews.add(const Text('asdf'));

  //   // listViews.add(
  //   //   TitleView(
  //   //     titleTxt: 'Mediterranean diet',
  //   //     subTxt: 'Details',
  //   //     animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //   //         parent: widget.animationController!,
  //   //         curve: const Interval((1 / count) * 0, 1.0,
  //   //             curve: Curves.fastOutSlowIn))),
  //   //     animationController: widget.animationController!,
  //   //   ),
  //   // );

  //   listViews.add(
  //     const StepNumberView(
  //         // animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //         //     parent: widget.animationController!,
  //         //     curve: const Interval((1 / count) * 1, 1.0,
  //         //         curve: Curves.fastOutSlowIn))),
  //         // animationController: widget.animationController!,
  //         ),
  //   );

  //   listViews.add(
  //     StepLineView(
  //       // animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //       //     parent: widget.animationController!,
  //       //     curve: const Interval((1 / count) * 1, 1.0,
  //       //         curve: Curves.fastOutSlowIn))),
  //       // animationController: widget.animationController!,
  //       spotData: spotListJson,
  //     ),
  //   );
  // }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: backAppBar(
      //   context, Strings.myDairyStepTitle,
      //   // backgroundColor: Colors.transparent,
      //   // rightImgPath: 'assets/images/ic_set_black.png',
      //   backgroundColor: Colors.transparent,
      // ),
      // backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
            //设置Container修饰
            image: DecorationImage(
              //背景图片修饰
              image: AssetImage("assets/images/step_b2.jpg"),
              fit: BoxFit.cover, //覆盖
            ),
          )),
          // getBackground(),
          getMainListViewUI(),
          // getAppBarUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  Widget getMainListViewUI() {
    return Column(
      children: [
        // Text(
        //   Strings.myDairyStepTitle,
        //   style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20.0,
        //       color: Colors.blueAccent),
        // ),
        // TitleView(
        //   titleTxt: 'Mediterranean diet',
        //   subTxt: 'Details',
        //   animation: Tween<double>(begin: 0.0, end: 1.0).animate(
        //       CurvedAnimation(
        //           parent: widget.animationController!,
        //           curve: const Interval((1 / 4) * 0, 1.0,
        //               curve: Curves.fastOutSlowIn))),
        //   animationController: widget.animationController!,
        // ),
        const SizedBox(height: 40),
        Text(
          Strings.myDairyStepTitle,
          style: const TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 100),
        StepNumberView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: const Interval((1 / 2) * 1, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
        const SizedBox(height: 20),

        StepDataView(),
        const Expanded(child: SizedBox()),

        SizedBox(
            height: 60,
            width: 60,
            child: TextButton(
              onPressed: () {},
              child: const Text('停止'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent), //背景颜色
                  foregroundColor:
                      MaterialStateProperty.all(Colors.lightBlue), //字体颜色
                  overlayColor:
                      MaterialStateProperty.all(const Color(0xffffffff)), // 高亮色
                  shadowColor:
                      MaterialStateProperty.all(const Color(0xffffffff)), //阴影颜色
                  elevation: MaterialStateProperty.all(2), //阴影值
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 16)), //字体
                  side: MaterialStateProperty.all(const BorderSide(
                      width: 1, color: Color(0xffCAD0DB))), //边框
                  shape: MaterialStateProperty.all(const CircleBorder(
                      side: BorderSide(
                    //设置 界面效果
                    color: Colors.green,
                    width: 500.0,
                    style: BorderStyle.none,
                  )))),
            )),
        const SizedBox(height: 20),
        // Expanded(
        //     child: StepLineView(
        //   // animation: Tween<double>(begin: 0.0, end: 1.0).animate(
        //   //     CurvedAnimation(
        //   //         parent: widget.animationController!,
        //   //         curve: const Interval((1 / 2) * 1, 1.0,
        //   //             curve: Curves.fastOutSlowIn))),
        //   // animationController: widget.animationController!,
        //   spotData: spotListJson,
        // )),
        // const SizedBox(height: 20),
      ],
    );
  }

  Widget getBackground() {
    return GradualChangeView(
      colors: const [Color(0xFFb52083), Color(0xFF0697f9)],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
