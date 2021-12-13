import 'package:flutter/material.dart';
import 'package:foot/commons/config/const.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/commons/route/navigator_utils.dart';
import 'package:foot/commons/win_media.dart';
import 'package:foot/feature/main_router.dart';
import 'package:foot/feature/update/update_router.dart';
import 'package:foot/utils/theme/app_theme.dart';
import 'package:foot/widget/list_tile_view.dart';

import 'mine_router.dart';

class MineMenuView extends StatefulWidget {
  const MineMenuView({Key? key}) : super(key: key);

  @override
  _MineMenuViewState createState() => _MineMenuViewState();
}

class _MineMenuViewState extends State<MineMenuView> {
  // List data = [
  //   {'label': '支付', 'icon': 'assets/images/mine/ic_pay.png'},
  //   {'label': '收藏', 'icon': 'assets/images/favorite.webp'},
  //   {'label': '相册', 'icon': 'assets/images/mine/ic_card_package.png'},
  //   {'label': '卡片', 'icon': 'assets/images/mine/ic_card_package.png'},
  //   {'label': '表情', 'icon': 'assets/images/mine/ic_emoji.png'},
  //   {'label': '设置', 'icon': 'assets/images/mine/ic_setting.png'},
  // ];

  List data = [
    {'label': '收藏', 'icon': 'assets/images/ic_small_code.png'},
    {'label': '相册', 'icon': 'assets/images/ic_small_code.png'},
    {'label': '卡片', 'icon': 'assets/images/ic_small_code.png'},
    // {'label': '通讯录', 'icon': 'assets/images/address_book.png'},
    {'label': '设置', 'icon': 'assets/images/ic_setting.png'},
    {'label': '更新', 'icon': 'assets/images/ic_update.png'},
    {'label': '退出登录', 'icon': 'assets/images/power.png'},
  ];

  Widget buildContent(item) {
    return ListTileView(
      border: item['label'] == '支付' ||
              item['label'] == '设置' ||
              item['label'] == '表情'
          ? null
          : const Border(bottom: BorderSide(color: lineColor, width: 0.2)),
      title: item['label'],
      titleStyle: const TextStyle(fontSize: 15.0),
      isLabel: false,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      icon: item['icon'],
      margin: EdgeInsets.symmetric(
          vertical:
              item['label'] == '支付' || item['label'] == '设置' ? 10.0 : 0.0),
      onPressed: () => menuClick(item),
      width: 40.0,
      fit: BoxFit.cover,
      horizontal: 15.0,
    );
  }

  menuClick(var item) {
    var label = item['label'];
    logger.d(label);
    switch (label) {
      case '通讯录':
        NavigatorUtils.push(context, MineRouter.contactListPage);
        break;
      case '更新':
        NavigatorUtils.push(context, UpdateRouter.updatePage);
        break;
      case '退出登录':
        NavigatorUtils.push(context, MainRouter.loginPage, clearStack: true);
        break;
      default:
    }
  }

  // Widget exitButton() {
  //   return Column(
  //     children: <Widget>[
  //       ListTile(
  //         title: Text(
  //           '退出',
  //           style: TextStyle(
  //             fontFamily: AppTheme.fontName,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 16,
  //             color: AppTheme.darkText,
  //           ),
  //           textAlign: TextAlign.left,
  //         ),
  //         trailing: Icon(
  //           Icons.power_settings_new,
  //           color: Colors.red,
  //         ),
  //         onTap: () {
  //           // onTapped();
  //         },
  //       ),
  //       SizedBox(
  //         height: MediaQuery.of(context).padding.bottom,
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: Column(children: data.map(buildContent).toList()),
    );
  }
}
