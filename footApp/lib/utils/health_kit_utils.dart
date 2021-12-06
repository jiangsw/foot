import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_health/huawei_health.dart';

class HealthKitUtils {
  late DataController _dataController;

  void initDataController() async {
    // if (!mounted) return;
    // log('init', _dataTextController, LogOptions.call);
    // try {
    //   _dataController = await DataController.init(<HiHealthOption>[
    //     HiHealthOption(DataType.DT_CONTINUOUS_STEPS_DELTA, AccessType.read),
    //     HiHealthOption(DataType.DT_CONTINUOUS_STEPS_DELTA, AccessType.write),
    //     HiHealthOption(DataType.DT_INSTANTANEOUS_HEIGHT, AccessType.read),
    //     HiHealthOption(DataType.DT_INSTANTANEOUS_HEIGHT, AccessType.write),
    //     HiHealthOption(DataType.DT_CONTINUOUS_CALORIES_BURNT, AccessType.read),
    //     HiHealthOption(DataType.DT_CONTINUOUS_DISTANCE_DELTA, AccessType.read),
    //   ]);
    //   // log('init', _dataTextController, LogOptions.success);
    // } on PlatformException catch (e) {
    //   // log('init', _dataTextController, LogOptions.error, error: e.message!);
    // }
  }
}
