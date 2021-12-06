import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/commons/route/navigator_utils.dart';
import 'package:foot/feature/ranking/motion_ranking_view.dart';
import 'package:foot/feature/ranking/ranking_router.dart';
import 'package:foot/widget/utils/color_utils.dart';
import 'package:foot/widget/utils/screen_utils.dart';
import 'package:logger/logger.dart';

List _dataArr = [
  {
    "time": "2020年5月8日 22:10",
    "ranking": "10",
    "steps": "2861",
    "img": "assets/images/picture/touxiang_1.jpeg",
    "text": "夺得05月08日排行榜冠军",
    "color": "#00AE5B",
  },
  {
    "time": "2020年6月6日 22:22",
    "ranking": "3",
    "steps": "12180",
    "img": "assets/images/picture/touxiang_2.jpeg",
    "text": "夺得6月6日排行榜冠军",
    "color": "#FF8B22",
  },
  {
    "time": "2020年7月12日 22:01",
    "ranking": "7",
    "steps": "1986",
    "img": "assets/images/picture/touxiang_3.jpeg",
    "text": "夺得7月12日排行榜冠军",
    "color": "#00AE5B",
  },
  {
    "time": "2020年8月18日 22:09",
    "ranking": "6",
    "steps": "23354",
    "img": "assets/images/picture/touxiang_4.jpeg",
    "text": "夺得8月18日排行榜冠军",
    "color": "#FF8B22",
  },
  {
    "time": "2020年9月9日 22:23",
    "ranking": "1",
    "steps": "20015",
    "img": "assets/images/picture/touxiang_5.jpeg",
    "text": "夺得9月9日排行榜冠军",
    "color": "#FF8B22",
  },
];

class MyMotionRankingView extends StatefulWidget {
  const MyMotionRankingView({Key? key}) : super(key: key);

  @override
  _MyMotionRankingViewState createState() => _MyMotionRankingViewState();
}

class _MyMotionRankingViewState extends State<MyMotionRankingView>
    with AutomaticKeepAliveClientMixin {
// class MyMotionRankingView extends StatelessWidget {
  // const MyMotionRankingView({Key? key}) : super(key: key);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: backAppBar(context, '我的排行榜',
          rightImgPath: 'assets/images/ic_set_black.png',
          backgroundColor: Colors.transparent, rightItemCallBack: () {
        _clickCell(context, '设置');
      }),
      body: _body(context, _dataArr),
      backgroundColor: KColor.kWeiXinBgColor,
      // bottomNavigationBar: _bottomView(context),
    );
  }

  Widget _body(context, dataArr) {
    return ListView.builder(
        itemCount: _dataArr.length,
        // itemExtent: 150.0, //强制高度为100.0
        itemBuilder: (context, index) {
          return _cell(context, dataArr[index]);
        });
  }

  //cell
  Widget _cell(context, item) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            item['time'],
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
        InkWell(
          onTap: () => _jumpTop(context, item),
          child: Card(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              // 抗锯齿
              clipBehavior: Clip.antiAlias,
              //普通的边
              //shape: Border.all(color: Colors.yellow, width: 5.0),
              elevation: 3,
              // 阴影大小
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.white,
                // child: ListTile(
                //   title: Text(item['title']),
                //   subtitle: Text(
                //     item['subtitle'],
                //   ),
                //   onTap: () => _clickCell(context, item['title']),
                // ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item['ranking'],
                                    style: TextStyle(
                                        color:
                                            ColorUtils.hexColor(item['color']),
                                        fontSize: 35),
                                  ),
                                  Text(
                                    '名次',
                                    style: TextStyle(
                                        color:
                                            ColorUtils.hexColor(item['color']),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    item['steps'],
                                    style: TextStyle(
                                        color:
                                            ColorUtils.hexColor(item['color']),
                                        fontSize: 35),
                                  ),
                                  Text(
                                    '步数',
                                    style: TextStyle(
                                        color:
                                            ColorUtils.hexColor(item['color']),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      color: KColor.kLineColor,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            item['img'],
                            width: 40,
                          ),
                        ),
                        title: Text(
                          item['text'],
                          style: TextStyle(
                            color: ColorUtils.hexColor(item['color']),
                            fontSize: 15,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Colors.black26),
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }

  _showMotionRanking(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return const MotionRankingPage();
        });
  }

  //点击cell
  _clickCell(context, text) {
    // JhToast.showText(context, msg: '点击 ${text}');
  }

  _bottomView(context) {
    return Container(
      height: ScreenUtils.bottomSafeHeight + 60,
      color: Colors.white,
      child: SafeArea(
          child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Container(
                height: 60,
                color: Colors.white,
                child: const Center(child: Text('步数排行榜')),
              ),
              onTap: () => _clickCell(context, '步数排行榜'),
            ),
          )
        ],
      )),
    );
  }

  _jumpTop(context, item) {
    // _showMotionRanking(context);
    NavigatorUtils.push(context, RankingRouter.motionRankingPage);
    // NavigatorUtils.pushNamed(context, 'WxMotionTopPage');
  }
}
