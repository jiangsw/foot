// import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot/commons/config/styles.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/commons/route/navigator_utils.dart';
import 'package:foot/feature/main_router.dart';
// import 'package:foot/commons/route/navigator_utils.dart';
// import 'package:school/commons/declare.dart';
// import 'package:school/commons/res/styles.dart';
// import 'package:school/features/main_router.dart';
// import 'package:school/features/route/NavigatorUtils.dart';
// import 'package:school/features/service/APIs.dart';

// import 'package:school/utils/dio/http_utils.dart';
// import 'package:school/utils/user_utils.dart';
// import 'package:school/widgets/alert_service.dart';
// import 'package:sp_util/sp_util.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isShowUserDelete = false;
  bool _isShowPwdDelete = false;

  bool isShowPassWord = false;
  bool isShowLoading = false;
  bool _isRememberMe = false;

  IconData _checkIcon = Icons.check_box;

  final _userController = TextEditingController();
  final _pwdController = TextEditingController();

  final FocusNode _pwdFocusNode = FocusNode();

  final FocusNode _userFocusNode = FocusNode();

  // final String _userId = '';
  // final String _password = '';
  final Map<String, dynamic> _loginParams = {};

  /// 利用FocusNode和FocusScopeNode来控制焦点,
  ///
  /// 可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode

  @override
  void initState() {
    super.initState();
    _userController.text = '230101201001011234';
    _pwdController.text = '1234';

    _userListener();
    _pwdListener();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _userListener() {
    _isShowUserDelete =
        _userFocusNode.hasFocus && _userController.text.isNotEmpty;
    _userController.addListener(() {
      setState(() {
        _isShowUserDelete =
            _userController.text.isNotEmpty && _userFocusNode.hasFocus;
        // print('isDelete1=' + _isShowUserDelete.toString());
      });
    });
    _userFocusNode.addListener(() {
      setState(() {
        _isShowUserDelete =
            _pwdController.text.isNotEmpty && _userFocusNode.hasFocus;
        // print('isDelete2=' + _isShowUserDelete.toString());
      });
    });
  }

  void _pwdListener() {
    _isShowPwdDelete = _pwdFocusNode.hasFocus && _pwdController.text.isNotEmpty;
    _pwdController.addListener(() {
      setState(() {
        _isShowPwdDelete =
            _pwdController.text.isNotEmpty && _pwdFocusNode.hasFocus;
        // print('isDelete1=' + _isShowPwdDelete.toString());
      });
    });
    _pwdFocusNode.addListener(() {
      setState(() {
        _isShowPwdDelete =
            _pwdController.text.isNotEmpty && _pwdFocusNode.hasFocus;
        // print('isDelete2=' + _isShowPwdDelete.toString());
      });
    });
  }

  void _onLogin(_isStudent) {
    // final form = _formKey.currentState;
    // form!.save();

    _loginParams['isStudent'] = _isStudent;

    _loginParams['username'] = _userController.text.toString();
    _loginParams['password'] = _pwdController.text.toString();

    // logger.d('username=${_userController.text}');
    // logger.d('password=$_pwdController.text');

    if (_isStudent) {
      _loginParams['username'] = "230101201001011234";
      _loginParams['password'] = '1234';
    } else {
      _loginParams['username'] = "teacher";
      _loginParams['password'] = '123';
    }

    NavigatorUtils.push(context, MainRouter.homeScreen, clearStack: true);

    // if (_userController.text == '') {
    //   AlertService().showAlert(
    //       message: "请输入用户名称", type: AlertType.warning, context: context);
    //   return;
    // }
    // if (_pwdController.text == '') {
    //   AlertService().showAlert(
    //       message: "请输入密码", type: AlertType.warning, context: context);
    //   return;
    // }

    // _handleLogin(_loginParams);
  }

  // _handleLogin(Map<String, dynamic> params) async {
  //   await SpUtil.getInstance();

  //   // showLoadingDialog(context, '登录中...');
  //   // isShowLoading = true;

  //   HttpUtils.post(APIs.login, params, message: '登录中...', success: (data) {
  //     if (data["code"] == 200) {
  //       Map<String, dynamic> json = Map<String, dynamic>.from(data["data"]);

  //       UserUtils.setToken(json['token']);
  //       _getUserInfo();
  //     } else {}
  //   }, fail: (code, message) {
  //     // hide();
  //   });
  // }

  // _getUserInfo() async {
  //   HttpUtils.post(APIs.getUserInfo, _loginParams, success: (data) {
  //     if (data["code"] == 200) {
  //       UserUtils.saveUserInfo(data['data']);
  //       // if (isShowLoading) {
  //       //   Navigator.of(context, rootNavigator: true).pop();
  //       //   // isShowLoading = false;
  //       // }
  //       // pushAndRemovePage(context, HomePage());
  //       NavigatorUtils.push(context, MainRouter.homePage, clearStack: true);
  //     }
  //   }, fail: (code, message) {
  //     // hide();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(

            /// 注意这里要设置溢出如何处理，设置为visible的话，可以看到孩子，设置为clip的话，若溢出会进行裁剪
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(children: <Widget>[
                /// 创建表单
                _buildLoginTextForm(),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 140.0),
                child: _buildRemeberMe(),
              ),

              /// 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: _loginButton(),
              )
            ]));
  }

  Widget _buildLoginTextForm() {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white),
        width: 350.0,

        /// Flutter提供了一个Form widget，它可以对输入框进行分组，然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
        child: Form(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            /// 邮箱输入框
            _buildUserInput1(),

            Container(
                width: 300.0,
                height: 1.0,
                color: Colors.grey[100],
                padding: const EdgeInsets.only(top: 10.0)),

            /// 密码
            _buildPasswordInput1(),

            Container(
                width: 300.0,
                height: 1.0,
                color: Colors.grey[100],
                margin: const EdgeInsets.only(bottom: 20.0))
          ]),
        ));
  }

  // Widget _buildUserInput() {
  //   return Padding(
  //       padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
  //       child: TextFormField(
  //           controller: _userController,
  //           maxLines: 1,

  //           /// 输入类型
  //           keyboardType: TextInputType.emailAddress,

  //           /// 是否自动更正
  //           autocorrect: false,

  //           /// 是否自动获得焦点
  //           autofocus: false,

  //           /// 是否禁用textfield:如果为false, textfield将被“禁用”
  //           enabled: true,

  //           /// 键盘动作按钮点击之后执行的代码： 光标切换到指定的输入框
  //           onEditingComplete: () =>
  //               FocusScope.of(context).requestFocus(_pwdFocusNode),
  //           decoration: InputDecoration(
  //               icon: Icon(Icons.email, color: Colors.black),
  //               hintText: "用户名",
  //               border: InputBorder.none),

  //           /// 文本样式
  //           style: TextStyle(fontSize: 16, color: Colors.black)));
  // }

  // Widget _buildPasswordInput() {
  //   return Padding(
  //       padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
  //       child: TextFormField(
  //           controller: _pwdController,
  //           keyboardType: TextInputType.text,

  //           /// 关联焦点
  //           focusNode: _pwdFocusNode,

  //           /// 装饰器
  //           decoration: InputDecoration(
  //               icon: Icon(Icons.lock, color: Colors.black),
  //               hintText: "密码",
  //               border: InputBorder.none,
  //               suffixIcon: IconButton(
  //                   color: Theme.of(context).primaryColor,
  //                   icon: isShowPassWord
  //                       ? ImageIcon(AssetImage('assets/images/ic_pwd_open.png'))
  //                       : ImageIcon(
  //                           AssetImage('assets/images/ic_pwd_close.png')),
  //                   iconSize: 18.0,

  //                   //  Icon(
  //                   //     isShowPassWord
  //                   //         ? Icons.visibility
  //                   //         : Icons.visibility_off,
  //                   //     // ? CustomIcon.show_password
  //                   //     // : CustomIcon.hidden_password,
  //                   //     color: Colors.black),
  //                   onPressed: () => showPassword())),

  //           /// 控制键盘的功能键 指enter键，比如此处设置为next时，enter键显示的文字内容为 下一步
  //           textInputAction: TextInputAction.done,

  //           /// 最大行数
  //           maxLines: 1,

  //           /// 是否需要用******显示
  //           obscureText: !isShowPassWord,
  //           style: TextStyle(fontSize: 16.0, color: Colors.black)));
  // }

  Widget _buildUserInput1() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: TextFormField(
                focusNode: _userFocusNode,
                controller: _userController,
                maxLines: 1,

                /// 输入类型
                keyboardType: TextInputType.emailAddress,

                /// 是否自动更正
                autocorrect: false,

                /// 是否自动获得焦点
                autofocus: false,

                /// 是否禁用textfield:如果为false, textfield将被“禁用”
                enabled: true,

                /// 键盘动作按钮点击之后执行的代码： 光标切换到指定的输入框
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_pwdFocusNode),
                decoration: const InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black),
                    hintText: "用户名",
                    border: InputBorder.none),

                /// 文本样式
                style: const TextStyle(fontSize: 16, color: Colors.black))),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: false,
              child: _isShowUserDelete
                  ? IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Color(0xFFC8C8C8),
                        size: 20,
                      ),
                      onPressed: () {
                        _userController.text = "";
                      })
                  : const Text(""),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordInput1() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextField(
            // controller: _pwdController,
            keyboardType: TextInputType.text,

            /// 关联焦点
            focusNode: _pwdFocusNode,
            controller: _pwdController,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock, color: Colors.black),
              hintText: "密码",
              border: InputBorder.none,
              // suffixIcon: IconButton(
              //     color: Theme.of(context).primaryColor,
              //     icon: isShowPassWord
              //         ? ImageIcon(AssetImage('assets/images/ic_pwd_open.png'))
              //         : ImageIcon(AssetImage('assets/images/ic_pwd_close.png')),
              //     iconSize: 18.0,
              //     onPressed: () => showPassword())
              // // hintStyle: _hintTextStyle,
              // isDense: widget.isDense,
              // enabledBorder: widget.border != null
              //     ? widget.border
              //     : UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey, width: 0.8)),
              // focusedBorder: widget.border != null
              //     ? widget.border
              //     : UnderlineInputBorder(
              //         borderSide: BorderSide(
              //             color: Theme.of(context).primaryColor, width: 0.8)),
//          suffixIcon:
            ),
            obscureText: !isShowPassWord,
            onChanged: (value) {},
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Offstage(
              offstage: false,
              child: _isShowPwdDelete
                  ? IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Color(0xFFC8C8C8),
                        size: 20,
                      ),
                      onPressed: () {
                        _pwdController.text = "";
                      })
                  : const Text(""),
            ),
            Offstage(
                offstage: false,
                child: IconButton(
                  icon: isShowPassWord
                      ? const ImageIcon(
                          AssetImage('assets/images/ic_pwd_open.png'))
                      : const ImageIcon(
                          AssetImage('assets/images/ic_pwd_close.png')),
                  iconSize: 18.0,
                  onPressed: () {
                    showPassword();
                  },
                )),
          ],
        ),
      ],
    );
  }

  Widget _buildRemeberMe() {
    return Row(
      children: <Widget>[
        IconButton(
            onPressed: () {
              setState(() {
                _isRememberMe = !_isRememberMe;
                if (_isRememberMe) {
                  _checkIcon = Icons.check_box;
                } else {
                  _checkIcon = Icons.check_box_outline_blank;
                }
              });
            },
            icon: Icon(
              _checkIcon,
              color: Colors.white,
            )),
        Expanded(
          child: Text(
            '记住密码',
            style: TextStyles.kLabelStyle,
          ),
        )
      ],
    );
  }

  Widget _loginButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // CupertinoButton(
        //     child: const Text('学生登录'),
        //     padding: EdgeInsets.only(left: 120, right: 120),
        //     color: CupertinoColors.activeBlue,
        //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //     onPressed: () {
        //       _onLogin(true);
        //     }),
        // const Padding(padding: EdgeInsets.all(12.0)),
        // CupertinoButton(
        //   child: const Text('老师登录'),
        //   padding: EdgeInsets.only(left: 120, right: 120),
        //   color: CupertinoColors.activeGreen,
        //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //   onPressed: () {
        //     _onLogin(false);
        //   },
        // ),
        SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  child: Container(
//            margin: EdgeInsets.only(left: 6, right: 6),
                    padding: const EdgeInsets.only(
                        left: 25, top: 6, right: 25, bottom: 6),
                    height: 34,
//                  width: 44,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(20)),
                    ),
                    child: const Text(
                      '参赛人',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  onTap: () {
                    _onLogin(true);
                  }),
              InkWell(
                  child: Container(
//            margin: EdgeInsets.only(left: 6, right: 6),
                    padding: const EdgeInsets.only(
                        left: 25, top: 6, right: 25, bottom: 6),
                    height: 34,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeGreen,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20)),
                    ),
                    child: const Text('管理人',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    alignment: Alignment.centerLeft,
                  ),
                  onTap: () {
                    _onLogin(false);
                  }),
              const SizedBox(
                width: 6,
              )
            ],
          ),
        )
      ],
    );
  }

  void showPassword() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  // Future<void> _login() async {
//    User user = await ApiService.login(
//        _emailController.text.toString(), _pwdController.text.toString());
//
//    if (user != null) {
//      Store.value<UserModel>(context, listen: false)
//        ..setUser(
//          id: user.id,
//          email: '${user?.email}',
//          name: '${user.name}',
//          avatarPath: user.avatarUrl,
//          login: true,
//          mobile: user.mobile,
//        );
//      if (isShowLoading) {
//        Navigator.of(context).pop();
//      }
//      pushAndRemovePage(context, HomePage());
//    } else {
//      Toast.show(context, '登录失败');
//    }

  // await HttpUtils().post(
  //     ApiUrl.LOGIN,
  //     (data) {
  //       User user = User.fromMap(data);

  // Store.value<UserModel>(context, listen: false)
  //   ..setUser(
  //     id: 1,
  //     //user.id,
  //     email: _emailController.text,
  //     //'${user?.email}',
  //     name: "苍井空",
  //     //'${user.name}',
  //     avatarPath:
  //         "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4176017085,1014898947&fm=26&gp=0.jpg",
  //     //user.avatarUrl,
  //     login: true,
  //     mobile: "13000002212", //user.mobile,
  //   );

  /// 模拟登陆延迟两秒跳转到主页
  // Future.delayed(Duration(seconds: 2), () {
  //   if (isShowLoading) {
  //     Navigator.of(context).pop();
  //   }
  //   pushAndRemovePage(context, HomePage());
  // });
  // },
  // params: {
  //   'email': _emailController.text.toString(),
  //   'password': _pwdController.text.toString()
  // },
  // errorCallBack: (error) {
  //   if (isShowLoading) {
  //     Navigator.of(context).pop();
  //   }
  //   Toast.show(context, error.toString());
  // });
  // }
}
