import 'package:flutter/material.dart';
import 'package:foot/commons/config/const.dart';
import 'package:foot/commons/route/navigator_utils.dart';
import 'package:foot/commons/win_media.dart';
import 'package:foot/feature/mine/mine_router.dart';

class MineMeView extends StatefulWidget {
  const MineMeView({Key? key}) : super(key: key);

  @override
  _MineMeViewState createState() => _MineMeViewState();
}

class _MineMeViewState extends State<MineMeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
        child: InkWell(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: (topBarHeight(context) * 2.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: body(),
          ),
          onTap: () =>
              NavigatorUtils.push(context, MineRouter.personalInfoPage),
        ));
  }

  Widget body() {
    var row = [
      SizedBox(
        width: 60.0,
        height: 60.0,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Image.asset(defIcon, fit: BoxFit.cover),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 15.0),
        height: 60.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              '张三',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '部门一' + '     ',
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/ic_right_arrow_grey.webp',
                      width: 7.0, fit: BoxFit.cover),
                ])
          ],
        ),
      ),
      // const Spacer(),
      // Container(
      //   width: 13.0,
      //   margin: const EdgeInsets.only(right: 12.0),
      //   child: Image.asset('assets/images/ic_small_code.png',
      //       color: mainTextColor.withOpacity(0.5), fit: BoxFit.cover),
      // ),
      // Image.asset('assets/images/ic_right_arrow_grey.webp',
      //     width: 7.0, fit: BoxFit.cover),
    ];

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: row);
  }
}
