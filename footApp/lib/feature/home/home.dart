import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:foot/commons/provider/global_model.dart';
import 'package:foot/feature/assess/assess_list.dart';
import 'package:foot/feature/diary/my_dairy_screen.dart';
import 'package:foot/feature/mine/mine_screen.dart';
import 'package:foot/feature/party/party.dart';
import 'package:foot/feature/ranking/foot_ranking_screen.dart';
import 'package:foot/test/health_test.dart';
import 'package:foot/widget/utils/image_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  // late TabController _tabController;
  // late PageController _pageController;

  AnimationController? animationController;

  final List<Widget> _pageList = [];

  List<BottomNavigationBarItem> bottomTabs = [];

  final List<String> titleList = ['步数', '排行榜', '投票', '我的'];

  static const double _iconWH = 24.0;
  static const double _fontSize = 10.0;
  Color selColor = const Color(0xFF3BB815);

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);

    // _tabController = TabController(length: _pageList.length, vsync: this);
    // _pageController = PageController(initialPage: _currentIndex);

    _pageList.add(MyDiaryScreen(animationController: animationController));
    // _pageList.add(MyMotionRankingView());
    _pageList.add(const FootRankingScreen());
    _pageList.add(const AssessListPage());
    _pageList.add(const PartyScreen());
    _pageList.add(const MineScreen());

    // _pageList.add(LineChartPage1());
    // _pageList.add(HealthKitDemo());

    bottomTabs = getBottomTabs();

    // final List<Widget> _pageList = [
    //   const MyDiaryScreen(animationController),
    //   // OnePage(),
    //   // TwoPage(),
    //   // ThreePage(),
    //   // FourPage()
    // ];

    SchedulerBinding.instance!.addPostFrameCallback((Duration timestamp) {
      // 设置EasyRefresh的默认样式
      EasyRefresh.defaultHeader = ClassicalHeader(
        enableInfiniteRefresh: false,
        refreshText: '下拉刷新',
        refreshReadyText: '释放刷新',
        refreshingText: '加载中...',
        refreshedText: '加载完成',
        refreshFailedText: '加载失败',
        noMoreText: '没有更多',
        showInfo: false,
      );
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  List<BottomNavigationBarItem> getBottomTabs() {
    return [
      const BottomNavigationBarItem(
        label: '运动数据',
        icon: LoadAssetImage('tab/nav_foot', width: _iconWH),
        activeIcon: LoadAssetImage('tab/nav_foot_on', width: _iconWH),
      ),
      const BottomNavigationBarItem(
        label: "排行榜",
        icon: LoadAssetImage('tab/nav_tab_2', width: _iconWH),
        activeIcon: LoadAssetImage('tab/nav_tab_2_on', width: _iconWH),
      ),
      BottomNavigationBarItem(
        label: "知识闯关",
//      icon: LoadAssetImage('tab/nav_tab_3', width: _iconWH),
        activeIcon: const LoadAssetImage('tab/nav_tab_3_on', width: _iconWH),
        icon: Badge(
            padding: const EdgeInsets.all(4),
            position: BadgePosition.topEnd(top: -4, end: -4),
            child: const LoadAssetImage('tab/nav_tab_3', width: _iconWH)),
//      activeIcon: Badge(
//          padding: EdgeInsets.all(4),
//          position: BadgePosition.topRight(top: -4, right: -4),
//          child: LoadAssetImage('tab/nav_tab_3_on', width: _iconWH)),
      ),
      const BottomNavigationBarItem(
        label: "党建",
        icon: LoadAssetImage('tab/nav_tab_4', width: _iconWH),
        activeIcon: LoadAssetImage('tab/nav_tab_4_on', width: _iconWH),
      ),
      const BottomNavigationBarItem(
        label: "我的",
        icon: LoadAssetImage('tab/nav_tab_4', width: _iconWH),
        activeIcon: LoadAssetImage('tab/nav_tab_4_on', width: _iconWH),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context);

    return Scaffold(
//      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     titleList[_currentIndex],
      //     style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20.0,
      //         color: Colors.blueAccent),
      //   ),
      //   // appBar 组件设置背景色为透明，elevation 属性要设置为 0
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),

      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      // body: PageView(
      //   controller: _pageController,
      //   children: _pageList,
      //   onPageChanged: (index) {
      //     _tabController.animateTo(index);
      //   },
      // ),
      bottomNavigationBar:

//        Theme(
//          data: ThemeData(
//            highlightColor: Color.fromRGBO(0, 0, 0, 0),
//            splashColor: Color.fromRGBO(0, 0, 0, 0),
//          ),
//          child:
//          BottomNavigationBar(
////        unselectedItemColor:Colors.red,  //未选中颜色
////        selectedItemColor:Colors.yellow,  //选中颜色
//            fixedColor: selColor,  //选中的颜色
//            unselectedFontSize:_fontSize,
//            selectedFontSize:_fontSize,
//            type:BottomNavigationBarType.fixed,   //配置底部BaseTabBar可以有多个按钮
//            items: bottomTabs,
//            currentIndex: this._currentIndex,   //配置对应的索引值选中
//            onTap: (int index){
//              setState(() {  //改变状态
//                this._currentIndex=index;
//              });
//            },
//          ),
//
//        )

          BottomNavigationBar(
        unselectedItemColor: Colors.lightBlue, //未选中颜色
        // selectedItemColor: Colors.yellow, //选中颜色
        fixedColor: selColor,
        //选中的颜色
        unselectedFontSize: _fontSize,
        selectedFontSize: _fontSize,
        type: BottomNavigationBarType.fixed,
        //配置底部BaseTabBar可以有多个按钮
        items: bottomTabs,
        currentIndex: _currentIndex,
        //配置对应的索引值选中
        onTap: (int index) {
          model.refresh();
          setState(() {
            //改变状态
            _currentIndex = index;
            // _pageController.jumpToPage(_currentIndex);
          });
        },
      ),
    );
  }
}

/*-----------------------------------------------------------------------------*/
/*
BottomNavigationBar({
    Key key,
    @required this.items,  //必须有的item
    this.onTap,  //点击事件
    this.currentIndex = 0,  //当前选中
    this.elevation = 8.0,  //高度
    BottomNavigationBarType type,  //排列方式
    Color fixedColor,    //'Either selectedItemColor or fixedColor can be specified, but not both'
    this.backgroundColor,  //背景
    this.iconSize = 24.0,  //icon大小
    Color selectedItemColor,  //选中颜色
    this.unselectedItemColor,  //未选中颜色
    this.selectedIconTheme = const IconThemeData(),
    this.unselectedIconTheme = const IconThemeData(),
    this.selectedFontSize = 14.0,  //选中文字大小
    this.unselectedFontSize = 12.0,  //未选中文字大小
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels = true, //是否显示选中的Item的文字
    bool showUnselectedLabels,  //是否显示未选中的Item的问题
  })

 */
