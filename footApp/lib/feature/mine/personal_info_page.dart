import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:foot/base/base_appbar.dart';
import 'package:foot/commons/check.dart';
import 'package:foot/commons/commons.dart';
import 'package:foot/commons/config/const.dart';
import 'package:foot/commons/declare.dart';
import 'package:foot/commons/provider/global_model.dart';
import 'package:foot/commons/route/navigator_utils.dart';
import 'package:foot/widget/label_row.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:provider/provider.dart';

import 'mine_router.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  action(v) {
    logger.d(v);
    // if (v == '二维码名片') {
    //   routePush(new CodePage());
    // } else {
    //   print(v);
    // }
  }

  _choicePhoto() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      logger.d('pickedFile=${pickedFile!.path}');
      // _imageFile = pickedFile;
    });
  }

  // _openGallery({type = ImageSource.gallery}) async {
  //   // final model = Provider.of<GlobalModel>(context, listen: false);
  //   final imageFile = await _picker.pickImage(source: type);
  //   // List<int> imageBytes = await compressFile(imageFile);
  //   if (imageFile != null) {
  //     // String base64Img = 'data:image/jpeg;base64,${base64Encode(imageBytes)}';
  //     // uploadImgApi(context, base64Img, (v) {
  //     //   if (v == null) {
  //     //     showToast(context, '上传头像失败,请换张图像再试');
  //     //     return;
  //     //   }

  //     //   // setUsersProfileMethod(
  //     //   //   context,
  //     //   //   avatarStr: v,
  //     //   //   nickNameStr: model.nickName,
  //     //   //   callback: (data) {
  //     //   //     if (data.toString().contains('ucc')) {
  //     //   //       showToast(context, '设置头像成功');
  //     //   //       model.avatar = v;
  //     //   //       model.refresh();
  //     //   //     } else {
  //     //   //       showToast(context, '设置头像失败');
  //     //   //     }
  //     //   //   },
  //     //   // );
  //     // });
  //   }
  // }

  Widget dynamicAvatar(avatar, {size}) {
    if (isNetWorkImg(avatar)) {
      return CachedNetworkImage(
          imageUrl: avatar,
          cacheManager: cacheManager,
          width: size ?? null,
          height: size ?? null,
          fit: BoxFit.fill);
    } else {
      return Image.asset(avatar, fit: BoxFit.fill, width: size, height: size);
    }
  }

  Widget body(GlobalModel model) {
    List data = [
      {'label': '微信号', 'value': '1234567'},
      {'label': '二维码名片', 'value': ''},
      {'label': '更多', 'value': ''},
      {'label': '我的地址', 'value': ''},
    ];

    var content = [
      LabelRow(
        label: '头像',
        isLine: true,
        isRight: true,
        rightW: SizedBox(
          width: 55.0,
          height: 55.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.asset(defIcon, fit: BoxFit.cover),
          ),
        ),
        onPressed: () {
          _choicePhoto();
          // model.refresh();
        },
      ),
      LabelRow(
        label: '昵称',
        isLine: true,
        isRight: true,
        rValue: model.nickName,
        onPressed: () => NavigatorUtils.pushArgument(
            context, MineRouter.changeNamePage, model.nickName),
        // onPressed: () => routePush(new ChangeNamePage(model.nickName)),
      ),
      Column(
        children: data.map((item) => buildContent(item)).toList(),
      ),
    ];

    return Column(children: content);
  }

  Widget buildContent(item) {
    return LabelRow(
      label: item['label'],
      rValue: item['value'],
      isLine: item['label'] == '我的地址' || item['label'] == '更多' ? false : true,
      isRight: item['label'] == '微信号' ? false : true,
      margin: EdgeInsets.only(bottom: item['label'] == '更多' ? 10.0 : 0.0),
      rightW: item['label'] == '二维码名片'
          ? Image.asset('assets/images/ic_small_code.png',
              color: mainTextColor.withOpacity(0.7))
          : Container(),
      onPressed: () => action(item['label']),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context);

    return Scaffold(
      // backgroundColor: appBarColor,
      appBar: baseAppBar(context, '个人信息', backgroundColor: Colors.transparent),
      body: SingleChildScrollView(child: body(model)),
    );
  }
}
