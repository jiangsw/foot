import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/config/colors.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/commons/includes.dart';
import 'package:foot/commons/route/navigator_utils.dart';

import 'assess_router.dart';
// import 'package:school/features/route/NavigatorUtils.dart';
// import 'package:school/utils/user_utils.dart';

// import '../student_router.dart';

class AssessListPage extends StatefulWidget {
  const AssessListPage({Key? key}) : super(key: key);

  @override
  _AssessListPageState createState() => _AssessListPageState();
}

class _AssessListPageState extends State<AssessListPage> {
  // GlobalKey _formKey = new GlobalKey<FormState>();

  List _assessList = [];
  int _assessTaskId = 0;

  // EventBus eventBus = EventBus();

  @override
  void initState() {
    super.initState();

    // EventBusUtils.getInstance().on<EventsBean>().listen((event) {
    //   setState(() {
    //     EventsBean bean = event;
    //     print('id1=' + bean.id.toString());
    //   });
    // });

    _getAssessList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getAssessList() async {
    final jsonStr = await rootBundle.loadString('lib/res/assess_list.json');

    Map dic = json.decode(jsonStr);
    setState(() {
      _assessList = dic['data'];
    });
  }

  // _getAssessList() async {
  //   Map<String, dynamic> params = Map();
  //   params['school_id'] = UserUtils.getSchoolId();
  //   params['current_time'] =
  //       DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d);

  //   HttpUtils.get(APIs.getAssessList, params, success: (response) {
  //     if (response["code"] == 200) {
  //       setState(() {
  //         _assessList = response['data'];
  //       });
  //     }
  //   }, fail: (code, message) {
  //     // hide();
  //   });
  // }

  List<Widget> _buildAssessCard(BuildContext context) {
    var list = _assessList.map((value) {
      return GestureDetector(
        onTap: () {
          _assessTaskId = value['assess_task_id'];
          var _assessTaskName = value['assess_task_name'];
          // print(_assessTaskId);

          // EventBusUtils.getInstance()
          //     .fire(EventsBean(type: EventBusType.assess, id: _assessTaskId));

          // EventUtils.fire(
          //     EventsBean(type: EventBusType.assess, id: _assessTaskId));
          // setState(() {
          //   // _assessTaskId = value['assess_task_id'];
          //   // print(_assessTaskId);

          //   print('11');
          // Navigator.pushNamed(context, RouterConstant.studentAssessTaskPage);

          Map<String, dynamic> params = {};
          params['assess_task_id'] = _assessTaskId;
          params['assess_task_name'] = _assessTaskName;

          NavigatorUtils.pushArgument(context, AssessRouter.assessPage, params);
          //   print('22');
          // });
        },
        child: Card(
          margin: const EdgeInsets.all(10), //外边距
          elevation: 15.0, //设置阴影
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))), //设置圆角
          child: Column(
            //纵向排列组件
            children: <Widget>[
              // AspectRatio(
              //   //图片比例属性
              //   aspectRatio: 16 / 13,
              //   child: Image.asset(
              //     value["imageUrl"],
              //     fit: BoxFit.cover, //填充整个容器
              //   ),
              // ),
              ListTile(
                  // leading: ClipOval(
                  //     //头像位置及图片圆形属性
                  //     child: Image.asset(
                  //   value["imageUrl"],
                  //   fit: BoxFit.cover,
                  //   height: 60,
                  //   width: 60,
                  // )),
                  leading: const Icon(Icons.account_box),
                  title: Text(value["assess_task_name"],
                      style: const TextStyle(fontSize: 16)),
                  subtitle: Text(value["assess_template_name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, //文本溢出
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)))
            ],
          ),
        ),
      );
    });

    return list.toList();
  }

  Widget _getAssessListCard(BuildContext context) {
    return Column(
      children: _buildAssessCard(context),
    );
  }

  // Widget _enrollButton() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 28.0),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: TextButton(
  //             // padding: EdgeInsets.all(15.0),
  //             child: Text("保存"),
  //             style: ButtonStyle(
  //               textStyle: MaterialStateProperty.all(
  //                   TextStyle(fontSize: 16, color: Colors.orange)),
  //               backgroundColor:
  //                   MaterialStateProperty.all(Theme.of(context).primaryColor),
  //               foregroundColor: MaterialStateProperty.all(Colors.white),
  //               side: MaterialStateProperty.all(
  //                   BorderSide(color: Colors.greenAccent, width: 1)),
  //               shape: MaterialStateProperty.all(
  //                 RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(4.0)),
  //               ),
  //             ),
  //             onPressed: () {
  //               // _updateEnroll();
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
      Strings.assessListTitle,
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
      Expanded(child: getAssessList()),
    ]);
  }

  Widget getAssessList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        // key: _formKey, //开启自动校验
        child: EasyRefresh(
          header: BallPulseHeader(),
          // header: MaterialHeader(),
          child: Column(
            children: <Widget>[
              _getAssessListCard(context),
              // _enrollButton(),
            ],
          ),
          onRefresh: () async {
            // print('onRefersh');
            _getAssessList();
          },
        ),
      ),
    );
  }
}
