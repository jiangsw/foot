import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot/widget/gradual_change_view.dart';

import 'sign_in_page.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  PageController? _controller;
  late PageView _pageView;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // LogUtils.init();

    _controller = PageController();
    _pageView = PageView(
      controller: _controller,
      children: <Widget>[
        SignInPage(),
        // SignUpPage(),
      ],
      onPageChanged: (index) {
        setState(() => _currentPage = index);
      },
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(maxWidth: 750, maxHeight: 1334),
        orientation: Orientation.portrait);

    return Scaffold(
      body: Stack(children: <Widget>[
        // GradualChangeView(
        //   colors: [Color(0xFF25ADE5), Color(0xFF49784F)],
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        // ),
        SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                  //设置Container修饰
                  image: DecorationImage(
                    //背景图片修饰
                    image: AssetImage("assets/images/b2.jpg"),
                    fit: BoxFit.cover, //覆盖
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.only(top: 55.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          const SizedBox(height: 200),
                          // Text('黑龙江省未成年犯管教所'),

                          // /// 上面图片
                          // Hero(
                          //     tag: 'login_logo',
                          //     child: Image.asset(
                          //         'assets/images/police_badge.jpg',
                          //         width: 200,
                          //         height: 120)),

                          /// PageView
                          Expanded(child: _pageView)
                        ]))))
      ]),
    );
  }
}
