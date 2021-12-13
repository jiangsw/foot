import 'package:flutter/material.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/commons/provider/global_model.dart';
import 'package:foot/feature/diary/step_line_view.dart';
import 'package:foot/feature/diary/step_number_view.dart';
import 'package:foot/feature/mine/mine_me_view.dart';
import 'package:foot/feature/mine/mine_menu_view.dart';
import 'package:foot/utils/theme/fitness_app_theme.dart';
import 'package:foot/widget/gradual_change_view.dart';
import 'package:provider/provider.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);

  // final AnimationController? animationController;
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen>
    with SingleTickerProviderStateMixin {
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

  void getSpotList() {}

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

  // return new Column(
  //   children: <Widget>[
  //     new InkWell(
  //       child: new Container(
  //         color: Colors.white,
  //         height: (topBarHeight(context) * 2.5) - 10,
  //         padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
  //         child: new Row(
  //             crossAxisAlignment: CrossAxisAlignment.center, children: row),
  //       ),
  //       onTap: () => routePush(new PersonalInfoPage()),
  //     ),
  //     new Column(children: data.map(buildContent).toList()),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: backAppBar(
        //   context,
        //   Strings.assessListTitle,
        //   backgroundColor: Colours.appbarColor,
        // ),
        body: Stack(children: <Widget>[
          getBackground(),
          getViewUI(),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ]));
  }

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
      Strings.mineTitle,
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
      const MineMeView(),
      const MineMenuView(),
    ]);
  }
  // Widget getMainListViewUI() {
  //   return FutureBuilder<bool>(
  //     future: getData(),
  //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
  //       if (!snapshot.hasData) {
  //         return const SizedBox();
  //       } else {
  //         return ListView.builder(
  //           controller: scrollController,
  //           padding: EdgeInsets.only(
  //             top: AppBar().preferredSize.height +
  //                 MediaQuery.of(context).padding.top +
  //                 24,
  //             bottom: 62 + MediaQuery.of(context).padding.bottom,
  //           ),
  //           itemCount: listViews.length,
  //           scrollDirection: Axis.vertical,
  //           itemBuilder: (BuildContext context, int index) {
  //             // widget.animationController?.forward();
  //             return listViews[index];
  //           },
  //         );
  //       }
  //     },
  //   );
  // }
}
