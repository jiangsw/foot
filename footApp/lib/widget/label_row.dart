import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foot/commons/config/const.dart';

// import 'package:wechat_flutter/tools/wechat_flutter.dart';

class LabelRow extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final double? labelWidth;
  final bool isRight;
  final bool isLine;
  final String? value;
  final String? rValue;
  final Widget? rightW;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final Widget? headW;
  final double lineWidth;

  const LabelRow({
    Key? key,
    this.label,
    this.onPressed,
    this.value,
    this.labelWidth,
    this.isRight = true,
    this.isLine = false,
    this.rightW,
    this.rValue,
    this.margin,
    this.padding = const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 5.0),
    this.headW,
    this.lineWidth = mainLineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.white,
        padding: const EdgeInsets.all(0),
        onPressed: onPressed ?? () {},
        child: Container(
          padding: padding,
          margin: const EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            border: isLine
                ? Border(bottom: BorderSide(color: lineColor, width: lineWidth))
                : null,
          ),
          child: Row(
            children: <Widget>[
              if (headW != null) headW!,
              SizedBox(
                width: labelWidth,
                child: Text(
                  label ?? '',
                  style: const TextStyle(fontSize: 17.0),
                ),
              ),
              value != null
                  ? Text(value!,
                      style: TextStyle(
                        color: mainTextColor.withOpacity(0.7),
                      ))
                  : Container(),
              const Spacer(),
              rValue != null
                  ? Text(rValue!,
                      style: TextStyle(
                          color: mainTextColor.withOpacity(0.7),
                          fontWeight: FontWeight.w400))
                  : Container(),
              rightW ?? Container(),
              isRight
                  ? Icon(CupertinoIcons.right_chevron,
                      color: mainTextColor.withOpacity(0.5))
                  : Container(width: 10.0)
            ],
          ),
        ),
      ),
      margin: margin,
    );
  }
}
