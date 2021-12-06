import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot/commons/config/const.dart';
import 'package:foot/commons/win_media.dart';
import 'package:foot/widget/image_view.dart';

// import 'package:wechat_flutter/tools/wechat_flutter.dart';

class ListTileView extends StatelessWidget {
  final BoxBorder? border;
  final VoidCallback? onPressed;
  final String? title;
  final String? label;
  final String icon;
  final double width;
  final double horizontal;
  final TextStyle titleStyle;
  final bool isLabel;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final BoxFit? fit;

  const ListTileView({
    Key? key,
    this.border,
    this.onPressed,
    this.title,
    this.label,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0),
    this.isLabel = true,
    this.icon = 'assets/images/favorite.webp',
    this.titleStyle =
        const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    this.margin,
    this.fit,
    this.width = 45.0,
    this.horizontal = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title ?? '', style: titleStyle),
        Text(
          label ?? '',
          style: const TextStyle(color: mainTextColor, fontSize: 12),
        ),
      ],
    );

    var view = [
      isLabel ? text : Text(title!, style: titleStyle),
      const Spacer(),
      SizedBox(
        width: 7.0,
        child: Image.asset(
          'assets/images/ic_right_arrow_grey.webp',
          color: mainTextColor.withOpacity(0.5),
          fit: BoxFit.cover,
        ),
      ),
      // const Spacer(),
    ];

    var row = Row(
      children: <Widget>[
        Container(
          width: width - 5,
          margin: EdgeInsets.symmetric(horizontal: horizontal),
          child: ImageView(img: icon, width: width, fit: fit),
        ),
        Container(
          width: winWidth(context) - 90,
          padding: padding,
          decoration: BoxDecoration(border: border),
          child: Row(children: view),
        ),
      ],
    );

    return Container(
      margin: margin,
      child: FlatButton(
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        onPressed: onPressed ?? () {},
        child: row,
      ),
    );
  }
}
