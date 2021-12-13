import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/common_widgets.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/feature/diary/step_data_view.dart';
import 'package:foot/feature/diary/step_line_view.dart';
import 'package:foot/feature/diary/step_number_view.dart';
import 'package:foot/utils/loading_utils.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/gradual_change_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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
  var stepNbr = 0;
  var caloriesNbr = 0;
  var distanceNbr = 0;

  Map dairyMap = {};

  var spotListJson =
      '[{"x": 1, "y": 2344},{"x": 2, "y": 1231},{"x": 3, "y": 2353},{"x": 4, "y": 5679},{"x": 5, "y": 2325},{"x": 6, "y": 2479},{"x": 7, "y": 4597},{"x": 8, "y": 3896},{"x": 9, "y": 6907},{"x": 10, "y": 4975},{"x": 11, "y": 3547},{"x": 12, "y": 2956},{"x": 13, "y": 6542},{"x": 14, "y": 6734},{"x": 15, "y": 3258}]';
  // AnimationController? animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    // addAllListData();
    // init();
    super.initState();
  }

  void getSpotList() {}

  init() async {
    if (!mounted) return;
    LoadingUtils.show(text: Strings.signInHealthDataMessage);
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
        // HiHealthOption(DataType.DT, AccessType.read),
      ]);
      // log('init', _dataTextController, LogOptions.success);
      logger.d('init ', LogOptions.success);
      signIn(context);
    } on PlatformException catch (e) {
      logger.d('init ', LogOptions.error);

      CommonWidgets.showSnackBar(
          "Error on initDataController, Error:${e.toString()}, Error Description: " +
              "${HiHealthStatusCodes.getStatusCodeMessage(e.message)}",
          context);

      // log('init', _dataTextController, LogOptions.error, error: e.message!);
    }
  }

  void signIn(BuildContext context) async {
    // List of scopes to ask for authorization.
    //
    // Note: These scopes should also be authorized on the Huawei Developer Console.
    List<Scope> scopes = [
      Scope.HEALTHKIT_HEIGHTWEIGHT_READ,
      Scope.HEALTHKIT_HEIGHTWEIGHT_WRITE,
      Scope.HEALTHKIT_ACTIVITY_WRITE,
      Scope.HEALTHKIT_ACTIVITY_READ,
      Scope.HEALTHKIT_HEARTRATE_READ,
      Scope.HEALTHKIT_HEARTRATE_WRITE,
      Scope.HEALTHKIT_STEP_WRITE,
      Scope.HEALTHKIT_STEP_READ,
      Scope.HEALTHKIT_STEP_REALTIME,
      Scope.HEALTHKIT_DISTANCE_WRITE,
      Scope.HEALTHKIT_DISTANCE_READ,
      Scope.HEALTHKIT_SPEED_WRITE,
      Scope.HEALTHKIT_SPEED_READ,
      Scope.HEALTHKIT_LOCATION_WRITE,
      Scope.HEALTHKIT_LOCATION_READ,
      Scope.HEALTHKIT_ACTIVITY_RECORD_WRITE,
      Scope.HEALTHKIT_ACTIVITY_RECORD_READ,
      Scope.HEALTHKIT_CALORIES_READ,
      Scope.HEALTHKIT_CALORIES_WRITE
    ];
    try {
      AuthHuaweiId result = await HealthAuth.signIn(scopes);
      logger.d("Granted Scopes for User(${result.displayName}): " +
          result.grantedScopes.toString());
      CommonWidgets.showSnackBar('Authorization Success.', context,
          color: Colors.green);
      LoadingUtils.dismiss();
      // setState(() {
      //   readTodaySummation();
      // });
      // showSnackBar('Authorization Success.', context, color: Colors.green);
    } on PlatformException catch (e) {
      logger.d("Error on authorization, Error:${e.toString()}");
      LoadingUtils.dismiss();
      CommonWidgets.showSnackBar(
          "Error on authorization, Error:${e.toString()}, Error Description: " +
              "${HiHealthStatusCodes.getStatusCodeMessage(e.message)}",
          context);
    }
  }

  void readTodaySummation() async {
    LoadingUtils.show(text: Strings.loadingHealthDataMessage);
    // log('readTodaySummation', _dataTextController, LogOptions.call);
    try {
      CommonWidgets.showSnackBar('111111', context);
      SampleSet sampleSet = await _dataController
          .readTodaySummation(DataType.DT_CONTINUOUS_STEPS_DELTA);
      // log('readTodaySummation', _dataTextController, LogOptions.success,
      //     result: sampleSet.toString());

      CommonWidgets.showSnackBar('222222', context);

      Map m1 = sampleSet.samplePoints[0].fieldValues;

      CommonWidgets.showSnackBar('333333', context);

      logger.d(m1['steps(i)']);

      CommonWidgets.showSnackBar('m1=' + m1['steps(i)'].toString(), context);

      // showSampleSet(sampleSet);

      SampleSet sampleSet1 = await _dataController
          .readTodaySummation(DataType.DT_CONTINUOUS_CALORIES_BURNT);
      // log('readTodaySummation1', _dataTextController, LogOptions.success,
      //     result: sampleSet1.toString());

      Map m2 = sampleSet1.samplePoints[0].fieldValues;

      logger.d('calories: ' + m2['calories_total(f)'].toString());

      CommonWidgets.showSnackBar(
          'm2=' + m2['calories_total(f)'].toString(), context);

      SampleSet sampleSet2 = await _dataController
          .readTodaySummation(DataType.DT_CONTINUOUS_DISTANCE_DELTA);
      // log('readTodaySummation2', _dataTextController, LogOptions.success,
      //     result: sampleSet2.toString());

      Map m3 = sampleSet2.samplePoints[0].fieldValues;

      logger.d('distnace: ' + m3['distance(f)'].toString());

      CommonWidgets.showSnackBar('m3=' + m3['distance(f)'].toString(), context);

      // SampleSet sampleSet3 = await _dataController
      //     .readTodaySummation(DataType.DT_CONTINUOUS_WORKOUT_DURATION);
      // // log('readTodaySummation2', _dataTextController, LogOptions.success,
      // //     result: sampleSet2.toString());

      // logger.d(sampleSet3);

      // Map m4 = sampleSet3.samplePoints[0].fieldValues;
      // logger.d(
      //   'm4: $m4',
      // );

      setState(() {
        stepNbr = m1['steps(i)'];
        dairyMap['calories_nbr'] = m2['calories_total(f)'].toStringAsFixed(0);
        dairyMap['distance_nbr'] =
            (m3['distance(f)'] / 1000).toStringAsFixed(2);

        LoadingUtils.dismiss();
      });
    } on PlatformException catch (e) {
      logger.e(LogOptions.error, e.message);
      LoadingUtils.dismiss();
      CommonWidgets.showSnackBar(
          "Error on read, Error:${e.toString()}, Error Description: " +
              "${HiHealthStatusCodes.getStatusCodeMessage(e.message)}",
          context);

      CommonWidgets.showSnackBar(
          "Error on read, Error:${e.toString()}", context);

      // log('readTodaySummation', _dataTextController, LogOptions.error,
      //     error: e.message!);
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
          stepNumber: stepNbr,
        ),
        const SizedBox(height: 20),

        StepDataView(
          stepData: dairyMap,
        ),
        const Expanded(child: SizedBox()),

        SizedBox(
            height: 60,
            width: 60,
            child: TextButton(
              onPressed: () {
                readTodaySummation();
              },
              child: const Text('刷新'),
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
