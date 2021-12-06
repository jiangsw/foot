import 'package:flutter/material.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/feature/diary/step_line_view.dart';
import 'package:foot/feature/diary/step_number_view.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/gradual_change_view.dart';
import 'package:foot/widget/title_view.dart';

import 'my_motion_ranking_view.dart';

class FootRankingScreen extends StatefulWidget {
  const FootRankingScreen({Key? key, this.animationController})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _FootRankingScreenState createState() => _FootRankingScreenState();
}

class _FootRankingScreenState extends State<FootRankingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Animation<double>? topBarAnimation;

  var spotListJson =
      '[{"x": 1, "y": 2344},{"x": 2, "y": 1231},{"x": 3, "y": 2353},{"x": 4, "y": 5679},{"x": 5, "y": 2325},{"x": 6, "y": 2479},{"x": 7, "y": 4597},{"x": 8, "y": 3896},{"x": 9, "y": 6907},{"x": 10, "y": 4975},{"x": 11, "y": 3547},{"x": 12, "y": 2956},{"x": 13, "y": 6542},{"x": 14, "y": 6734},{"x": 15, "y": 3258}]';

  // AnimationController? animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    // addAllListData();
    super.initState();
  }

  // void getSpotList() {}

  // void addAllListData() {
  //   const int count = 4;

  //   listViews.add(const Text('asdf'));

  //   listViews.add(
  //     TitleView(
  //       titleTxt: 'Mediterranean diet',
  //       subTxt: 'Details',
  //       animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
  //           parent: widget.animationController!,
  //           curve: const Interval((1 / count) * 0, 1.0,
  //               curve: Curves.fastOutSlowIn))),
  //       animationController: widget.animationController!,
  //     ),
  //   );

  //   listViews.add(
  //     StepNumberView(
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

  // Future<bool> getData() async {
  //   await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: backAppBar(
        //   context,
        //   Strings.myFootRankingTitle,
        //   backgroundColor: Colours.appbarColor,
        //   // rightImgPath: 'assets/images/ic_set_black.png',
        //   // backgroundColor: Colors.transparent,
        // ),
        // backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getBackground(),
            // getMainListViewUI(),
            // getBarTitle(),
            getViewUI(),
            // getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  // Widget getMainListViewUI() {
  //   return Column(
  //     children: const [
  //       // TextField(
  //       //   decoration: const InputDecoration(
  //       //     hintText: '帐号/邮箱',
  //       //     contentPadding: const EdgeInsets.all(10.0),
  //       //   ),
  //       // ),
  //       MyMotionRankingView(),
  //     ],
  //   );
  // }

  // Widget getBackground() {
  //   return GradualChangeView(
  //     colors: const [Color(0xFFfbab66), Color(0xFFf7418c)],
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //   );
  // }

  Widget getBackground() {
    return Container(
        decoration: const BoxDecoration(
      //设置Container修饰
      image: DecorationImage(
        //背景图片修饰
        image: AssetImage("assets/images/assess_b1.jpg"),
        fit: BoxFit.cover, //覆盖
      ),
    ));
  }

  Widget getBarTitle() {
    return Text(
      Strings.myFootRankingTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.lightBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getViewUI() {
    return Column(children: [
      const SizedBox(height: 40),
      getBarTitle(),
      const SizedBox(height: 10),
      const Expanded(child: MyMotionRankingView()),
    ]);
  }

//   Widget getMainListViewUI() {
//     return FutureBuilder<bool>(
//   //     future: getData(),
//   //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//   //       if (!snapshot.hasData) {
//   //         return const SizedBox();
//   //       } else {
//   //         return ListView.builder(
//   //           controller: scrollController,
//   //           padding: EdgeInsets.only(
//   //             top: AppBar().preferredSize.height +
//   //                 MediaQuery.of(context).padding.top +
//   //                 24,
//   //             bottom: 62 + MediaQuery.of(context).padding.bottom,
//   //           ),
//   //           itemCount: listViews.length,
//   //           scrollDirection: Axis.vertical,
//   //           itemBuilder: (BuildContext context, int index) {
//   //             // widget.animationController?.forward();
//   //             return listViews[index];
//   //           },
//   //         );
//   //       }
//   //     },
//   //   );
//   // }
// }
}
