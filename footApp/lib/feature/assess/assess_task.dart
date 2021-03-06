import 'dart:async';
import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foot/commons/common_widgets.dart';
import 'package:foot/commons/config/strings.dart';
import 'package:foot/commons/declare.dart';

// import 'package:school/features/service/APIs.dart';
// import 'package:school/utils/dio/http_utils.dart';
// import 'package:school/utils/loading_utils.dart';
// import 'package:school/utils/user_utils.dart';
// import 'package:school/widgets/alert_service.dart';

class AssessTaskPage extends StatefulWidget {
  // int assessTaskId;
  final Map assessTaskMap;

  AssessTaskPage(this.assessTaskMap, {Key? key}) : super(key: key) {
    // logger.d('assessTaskMap=${assessTaskMap.toString()}');
  }

  @override
  _AssessTaskPageState createState() => _AssessTaskPageState();
}

class _AssessTaskPageState extends State<AssessTaskPage> {
  // GlobalKey _formKey = new GlobalKey<FormState>();

  StreamSubscription? subscription;

  final Map<int, TextEditingController> _textControllers = {};

  final int _assessTaskId = 1;
  List _questionList = [];
  final List _answerList = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    setState(() {
      _getAssessViewList();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getAssessViewList() async {
    final jsonStr = await rootBundle.loadString('lib/res/assess.json');

    Map dic = json.decode(jsonStr);
    setState(() {
      List _tList = dic['data'];
      for (var e in _tList) {
        if (e['assess_template_id'] == widget.assessTaskMap['assess_task_id']) {
          _questionList.add(e);
        }
      }

      _addController();
    });

    // print('assessTaskMap=' + widget.assessTaskMap.toString());

    // Map<String, dynamic> params = {};

    // _assessTaskId = widget.assessTaskMap['assess_task_id'] == 0
    //     ? 1
    //     : widget.assessTaskMap['assess_task_id'];

    // params['assess_task_id'] = _assessTaskId;

    // HttpUtils.get(APIs.getAssessViewByTaskId, params, success: (response) {
    //   if (response["code"] == 200) {
    //     if (mounted) {
    //       setState(() {
    //         _questionList = response['data'];
    //         _addController();
    //       });
    //     }
    //   }
    // }, fail: (code, message) {
    //   // hide();
    // });
  }

  _addController() {
    for (var element in _questionList) {
      _textControllers[element['assess_index_id']] =
          TextEditingController(text: '');
    }
  }

  _updateAssess() async {
    // LogUtils.d('_questionList=' + _questionList.toString());

    if (!_updateVerify()) {
      // AlertService().showAlert(
      //     message: "??????????????????????????????", type: AlertType.warning, context: context);
      return;
    }

    for (var element in _questionList) {
      int id = element['assess_index_id'];

      List subList = element['sub_index'];

      for (var e in subList) {
        int sid = e['assess_index_id'];
        int checkId = int.parse(element['check_list'][0] ?? '0'.toString());

        if (sid == checkId) {
          int isInput = e['is_input'];
          if (isInput == 1) {
            element['text'] = _textControllers[id]!.text.toString();
          }
        }
      }

      var text = element['text'] ?? '';

      // LogUtils.d('id=' +
      //     id.toString() +
      //     ' check_list=' +
      //     element['check_list'].toString() +
      //     ' is_checked=' +
      //     element['is_checked'].toString() +
      //     ' text=' +
      //     text);

      List checkList = element['check_list'];

      Map<String, dynamic> _answerMap = {};
      _answerMap['assess_index_id'] = id;
      _answerMap['answer_id'] = checkList.join(',');
      _answerMap['text'] = text;
      _answerList.add(_answerMap);
    }

    logger.d('_answerList=$_answerList');

    // Map<String, dynamic> _params = Map();
    // _params['answer'] = _answerList;
    // _params['assess_task_id'] = _assessTaskId;
    // _params['assessor_id'] = UserUtils.getUserId();

    // HttpUtils.post(APIs.updateAssess, _params, success: (response) {
    //   if (response["code"] == 200) {
    //     if (mounted) {
    //       setState(() {
    //         // _questionList = response['data'];
    //         // _addController();
    //       });
    //     }
    //   }
    // }, fail: (code, message) {
    //   // hide();
    // });

    // _textControllers.forEach((key, value) {
    //   String text = _textControllers[key]!.text.toString();
    //   LogUtils.d('key= ' + key.toString() + ' text=' + text);
    // });

    // Map<String, dynamic> _enrollParams = Map();
    // _enrollParams['enroll_id'] = this._enrollId;
    // _enrollParams['course_group_id'] = _courseGroupId;
    // _enrollParams['course_group_name'] = _courseGroupName;
    // _enrollParams['course_ids'] = _courseIds;
    // _enrollParams['student_id'] = UserUtils.getUserId();

    // HttpUtils.post(APIs.updateStudentCourse, _enrollParams, success: (data) {
    //   print('info=' + data['info']);
    //   ToastUtil.showToast(data['info']);
    // }, fail: (code, message) {
    //   // hide();
    // });
  }

  bool _updateVerify() {
    var result = true;
    for (var e in _questionList) {
      if (ObjectUtil.isEmpty(e['check_list'])) {
        result = false;
      }
    }

    return result;
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              // padding: EdgeInsets.all(15.0),
              child: const Text("??????"),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16, color: Colors.orange)),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.greenAccent, width: 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
              onPressed: () {
                _updateAssess();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: Text(Strings.assessTitle),
      // ),
      body: Stack(children: <Widget>[
        getBackground(),
        getViewUI(),
      ]),
    );
  }

  Widget getBackground() {
    return Container(
        decoration: const BoxDecoration(
      //??????Container??????
      image: DecorationImage(
        //??????????????????
        image: AssetImage("assets/images/assess_b1.jpg"),
        fit: BoxFit.cover, //??????
      ),
    ));
  }

  Widget getBarTitle() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonWidgets.goBack(context),
        ),
        Align(
            alignment: Alignment.center,
            child: Text(Strings.assessTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))),
      ],
    );

    // return Row(
    //   children: <Widget>[
    //     //??????????????????????????????,????????????Expanded ???flex
    //     Expanded(
    //       flex: 1,
    //       child: InkWell(
    //           //??????InkWell????????????????????????,????????????????????????
    //           onTap: () {
    //             print('?????????');
    //           },
    //           child: Container(
    //             //????????????????????????
    //             alignment: Alignment.center,
    //             height: 40,
    //             padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
    //             //?????????????????????,????????????
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20),
    //               color: Colors.black12,
    //             ),
    //             child: Stack(
    //               alignment: Alignment.center,
    //               children: <Widget>[
    //                 Row(
    //                   //?????????Row???Column??????
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Icon(Icons.search, color: Colors.black38),
    //                     SizedBox(width: 10), //????????????????????????????????????
    //                     Text(
    //                       '????????????',
    //                       style: TextStyle(color: Colors.black38),
    //                     )
    //                   ],
    //                 ),
    //                 Align(
    //                   alignment: Alignment.centerRight,
    //                   child: IconButton(
    //                     icon: Icon(Icons.picture_in_picture),
    //                     color: Colors.black38,
    //                     onPressed: () {
    //                       print('??????????????????');
    //                     },
    //                   ),
    //                 )
    //               ],
    //             ),
    //           )),
    //     ),
    //     Expanded(
    //       flex: 0,
    //       child: IconButton(
    //         icon: Icon(Icons.notifications),
    //         color: Colors.black38,
    //         onPressed: () {},
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget getViewUI() {
    return Column(children: [
      const SizedBox(height: 40),
      getBarTitle(),
      // const SizedBox(height: 10),
      Expanded(child: _getAssessTask()),
    ]);
  }

  Widget _getAssessTask() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //?????????????????????TextField?????? ??????????????????
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ListView(
        shrinkWrap: true, //???????????????widget?????????????????????ListView????????????????????????false
        controller: _scrollController,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.assessTaskMap['assess_task_name'],
                  overflow: TextOverflow.ellipsis, // ?????????????????????????????????...
                  maxLines: 2, // ??????????????????????????????
                  style: const TextStyle(
                    // color: Color.fromRGBO(0, 0, 0, 1.0), //opacity???????????????
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PingFangBold',
                    fontSize: 15.0,
                  ),
                ),
                Container(
                  child: _buildList(),
                ),
                _showButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      shrinkWrap: true, //???????????????widget?????????????????????ListView????????????????????????false
      physics: const NeverScrollableScrollPhysics(), // ??????????????????????????????????????????
      //itemCount +1 ????????????????????????????????????progressbar
      itemCount: _questionList.length,
      itemBuilder: (context, index) {
        // ????????????
        return Card(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            //????????????
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            // ?????????
            clipBehavior: Clip.antiAlias,
            //????????????
            //shape: Border.all(color: Colors.yellow, width: 5.0),
            elevation: 1,
            // ????????????
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              // decoration: BoxDecoration(
              //   border: Border.all(
              //       color: const Color(0xFFFF0000), width: 0.5), // ??????????????????
              //   // color: Color(0xFF9E9E9E), // ??????
              //   borderRadius: BorderRadius.circular((20.0)), // ?????????
              //   // borderRadius: new BorderRadius.vertical(
              //   //     top: Radius.elliptical(20, 20)), // ??????????????????????????????
              // ),
              // color: Colors.amberAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_questionList[index]["assess_index_name"],
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black)),
                  Offstage(
                    // ?????? ????????????maxChoice????????? ????????????
                    offstage: _questionList[index]['index_type'] == 2
                        // &&  _questionList[index]["max_choice"] != 0
                        ? false
                        : true,
                    child: Text(
                      '(???????????????' +
                          _questionList[index]["max_choice"].toString() +
                          "???)",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  _questionList[index]['index_type'] == 1
                      ? _buildRadioChoiceRow(_questionList[index])
                      : _questionList[index]['index_type'] == 2
                          ? _buildCheckboxChoiceRow(_questionList[index],
                              _questionList[index]["max_choice"])
                          : _buildTextControllerRow(_questionList[index]),
                ],
              ),
            ));
      },
    );
  }

  // ?????? ?????????Radio ????????????????????? ??????
  Widget _buildRadioChoiceRow(question) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // ??????????????????????????????????????????
      shrinkWrap: true, //???????????????widget?????????????????????ListView????????????????????????false
      itemCount: question['sub_index'].length,
      itemBuilder: (context, index) {
        var optionContent = question['sub_index'][index]["assess_index_name"];
        // print(
        //     'is_input: ' + question['sub_index'][index]["is_input"].toString());
        // return _radioListItem(question, optionContent, index, optionContent);
        if (question['sub_index'][index]["is_input"] == 0) {
          // print('????????????: ' + question['sub_index'][index]["is_input"].toString());
          return _radioListItem(question, optionContent, index, optionContent);
        } else {
          // ???????????? ????????????
          var radioTitle = optionContent.replaceAll("#OTHER#", "");
          // print('???????????????: ' + radioTitle);
          // print('??????: ' + optionContent.indexOf("#OTHER#").toString());
          return Row(
            children: <Widget>[
              SizedBox(
                width: 150,
                child:
                    _radioListItem(question, optionContent, index, radioTitle),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                color: const Color(0xFFFFFFFF),
                // ????????????  ?????????
                child: _buildTextOtherController(question),
              )
            ],
          );
        }
      },
    );
  }

  Widget _radioListItem(question, optionContent, optionIndex, radioTitle) {
    return Row(
      children: <Widget>[
        // ?????????????????????RadioListTile????????????????????????????????????????????????????????????????????????????????????
        Radio(
          value: question['sub_index'][optionIndex]['assess_index_id']
              .toString(), // ?????????string??????
          hoverColor: const Color(0xFF6DD2F3),
          activeColor: const Color(0xFF2EEAFC),
          focusColor: const Color(0xFFFFFFFF),
          fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),

          groupValue: question['is_checked'], // ???value???????????????
          onChanged: (val) {
            // ????????????
            question['check_list'].clear();
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              question['is_checked'] = val;
              question['check_list'].add(val);
              // print('?????????: ' + val.toString());
            });
          },
        ),
        Expanded(
          // Row????????????Text???????????? ?????????Expanded
          child: Text(
            radioTitle,
            // style: const TextStyle(color: Colors.yellowAccent),
            softWrap: true, // ????????????
          ),
        ),
      ],
    );
  }

  // ?????? ?????????Checkbox ????????????????????? ??????
  Widget _buildCheckboxChoiceRow(question, maxChoice) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // ??????????????????????????????????????????
      shrinkWrap: true, //???????????????widget?????????????????????ListView????????????????????????false
      itemCount: question['sub_index'].length,
      itemBuilder: (context, index) {
        var optionContent = question['sub_index'][index]["assess_index_name"];

        return _checkboxListItem(
            question, maxChoice, optionContent, index, optionContent);

        // if (optionContent.indexOf("#OTHER#") == -1) {
        //   return _checkboxListItem(
        //       question, maxChoice, optionContent, index, optionContent);
        // } else {
        //   // ???????????? ????????????
        //   var checkboxTitle = optionContent.replaceAll("#OTHER#", "");
        //   // print('???????????????: ' + checkboxTitle);
        //   return new Row(
        //     children: <Widget>[
        //       Container(
        //         width: 150,
        //         child: _checkboxListItem(
        //             question, maxChoice, optionContent, index, checkboxTitle),
        //       ),
        //       Container(
        //         width: MediaQuery.of(context).size.width - 200,
        //         color: const Color(0xFFFFFFFF),
        //         // ????????????  ?????????
        //         child: _buildTextOtherController(question),
        //       )
        //     ],
        //   );
        // }
      },
    );
  }

  Widget _checkboxListItem(
      question, maxChoice, optionContent, optionIndex, checkboxTitle) {
    // print('question.is_check=' +
    //     question['sub_index'][optionIndex]['is_checked'].toString());
    return Row(
      children: <Widget>[
        // ?????????????????????CheckboxListTile????????????????????????????????????????????????????????????????????????????????????
        Checkbox(
          value: question['sub_index'][optionIndex]['is_checked'] == 1,
          hoverColor: const Color(0xFF6DD2F3),
          activeColor: const Color(0xFF2EEAFC),
          focusColor: const Color(0xFFFFFFFF),
          fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
          onChanged: (isCheck) {
            // ????????????
            FocusScope.of(context).requestFocus(FocusNode());
            _checkMaxChoise(question, maxChoice, optionIndex, isCheck);
          },
        ),
        Expanded(
          // Row????????????Text???????????? ?????????Expanded
          child: Text(
            checkboxTitle,
            // style: const TextStyle(color: Colors.yellowAccent),
            softWrap: true, // ????????????
          ),
        ),
      ],
    );
  }

  // ????????? ??????maxChoice????????????????????????
  void _checkMaxChoise(question, maxChoice, optionIndex, isCheck) {
    // print('_checkMaxChoise');
    setState(() {
      // print('_checkMaxChoise1');
      var optionId =
          question['sub_index'][optionIndex]['assess_index_id'].toString();
      // print('optionId=' + optionId);

      if (isCheck) {
        // print('?????????: ' + optionId);
        question['check_list'].add(optionId);
        question['sub_index'][optionIndex]['is_checked'] = 1;
        // print('_checkMaxChoise2');
        if (maxChoice != 0 && question['check_list'].length > maxChoice) {
          question['check_list'].remove(optionId);
          question['sub_index'][optionIndex]['is_checked'] = false;
          // LoadingUtils.showToast("????????????????????????????????????????????????");
        }
        // print('?????????: ' + question['check_list'].toString());
      } else {
        question['sub_index'][optionIndex]['is_checked'] = 0;
        question['check_list'].remove(optionId);
        // print('?????????: ' + question['check_list'].toString());
      }
    });
  }

  // ?????? ???????????? ????????? ??????
  Widget _buildTextControllerRow(question) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: const Color(0xFFFFFFFF),
          padding: const EdgeInsets.only(left: 8.0),
          child: _buildTextField(question['textController']),
        ));
  }

  // ?????? ???????????????????????? ??????
  Widget _buildTextOtherController(question) {
    // return _buildTextField(question['textOtherController']);
    return _buildTextField(question['assess_index_id']);
  }

  // ?????? ????????? ??????
  Widget _buildTextField(id) {
    // ???????????????`TextField`????????????????????????????????????????????????????????????????????????
    return TextField(
      cursorColor: const Color(0xFFFE7C30),
      cursorWidth: 1.0,
      keyboardType: TextInputType.multiline, //??????
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        // ?????????????????????
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (val) {},
      // controller: controller, // ???????????????????????????
      controller: _textControllers[id],
    );
  }
}
