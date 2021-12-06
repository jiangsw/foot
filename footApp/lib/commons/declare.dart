import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

DefaultCacheManager cacheManager = DefaultCacheManager();
