import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveService {
  static const String profile = "profile";
  static const String setting = "setting";
  static const String orders = "orders";
  static const String routes = "routes";
  static const String splash = "splash";

  @lazySingleton
  static Future<BoxCollection> init() async {
    var _hive = await BoxCollection.open(
        'driverHive', {profile, setting, orders, routes, splash});

    return _hive;
  }
}
