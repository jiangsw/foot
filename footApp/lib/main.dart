import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foot/commons/config/provider_config.dart';
import 'package:foot/commons/provider/global_model.dart';
import 'package:foot/commons/route/base_router.dart';
import 'package:foot/feature/login/login_page.dart';
import 'package:foot/utils/theme/app_theme.dart';
import 'package:provider/provider.dart';

// final _log = Logger('school');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderConfig.getInstance().getGlobal(MyApp()));

  // await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]).then((_) => runApp(MyApp()));
  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint(flutterErrorDetails.toString());
    return const Center(child: Text("App错误，快去反馈给作者!"));
  };
}

// void setupLocator() async {
//   locator.registerSingleton<EnrollService>(EnrollServiceImpl(),
//       signalsReady: true);

//   // locator.registerLazySingleton(() => PostService());
//   // locator.registerLazySingleton(() => Api());

//   // locator.registerLazySingleton(() => LoginModel());
//   // locator.registerFactory(() => HomeModel());
//   // locator.registerFactory(() => LikeButtonModel());
//   // locator.registerFactory(() => CommentsModel());
// }

// initLogging() {
//   // Print output to console.
//   Logger.root.onRecord.listen((LogRecord r) {
//     print('${r.time}\t${r.loggerName}\t[${r.level.name}]:\t${r.message}');
//   });

//   // Root logger level.
//   Logger.root.level = Level.FINEST;
// }

class MyApp extends StatelessWidget {
  final easyload = EasyLoading.init();

  MyApp({Key? key}) : super(key: key) {
    print('MyApp');
    BaseRouter.setRouter(FluroRouter());
    BaseRouter.registerConfigureRoutes(BaseRouter.getRouter());
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: model.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      onGenerateRoute: BaseRouter.getRouter().generator,
      builder: (context, child) {
        child = easyload(context, child);
        return child;
      },
      // home: const BaseTabBar(),
      home: LoginPage(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
