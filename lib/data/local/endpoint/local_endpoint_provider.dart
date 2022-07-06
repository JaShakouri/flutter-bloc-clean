import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalEndpointProvider {
  final BoxCollection _boxCollection;

  LocalEndpointProvider(this._boxCollection);
}
