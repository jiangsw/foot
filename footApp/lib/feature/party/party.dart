import 'package:flutter/material.dart';
import 'package:foot/commons/config/strings.dart';

class PartyScreen extends StatefulWidget {
  const PartyScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  final myImageAndCaption = [
    ["assets/images/party/eye.png", "党史波澜"],
    ["assets/images/party/balance.png", "党报要论"],
    ["assets/images/function.png", "党政资讯"],
    ["assets/images/function.png", "理论精辟"],
    ["assets/images/function.png", "党风廉政"],
    ["assets/images/function.png", "学法守规"],
    ["assets/images/function.png", "特色课堂"],
    ["assets/images/function.png", "知识通关"],
    ["assets/images/function.png", "荐书尚学"],
    ["assets/images/function.png", "榜样事迹"],
    ["assets/images/function.png", "两学一做"],
    ["assets/images/function.png", "三产三实"],
  ];

  Widget getBarTitle() {
    return Text(
      Strings.partyTitle,
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
      Expanded(child: getMenu()),
    ]);
  }

  Widget getMenu() {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        ...myImageAndCaption.map(
          (i) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: AssetImage(i.first),
                ),
              ),
              // CircleAvatar(
              //   backgroundImage: AssetImage(i.first),
              //   backgroundColor: Colors.pinkAccent,
              //   radius: 20,
              // ),
              // Material(
              //   shape: CircleBorder(),
              //   elevation: 3.0,
              //   child: Image.asset(
              //     i.first,
              //     fit: BoxFit.contain,
              //     height: 80,
              //     width: 80,
              //   ),
              // ),
              const SizedBox(
                height: 10,

                // FittedBox(
                //   fit: BoxFit.cover,
                //   child: Text(
                //     i.last,
                //     style: TextStyle(fontSize: 10),
                //   ),
                // ),
              ),
              Text(
                i.last,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: getViewUI(),
      ),
    );
  }
}
