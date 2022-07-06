import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:supplier_drivers/domain/config/flavor_config.dart';

@module
abstract class DioService {
  @singleton
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(DioLoggingInterceptor());

    _dio.options.connectTimeout = 10;
    _dio.options.receiveTimeout = 20;
    _dio.options.sendTimeout = 30;

    _dio.options.followRedirects = true;
    _dio.options.responseType = ResponseType.json;

    _dio.options.baseUrl = FlavorConfig.instance!.values.baseUrl;
    return _dio;
  }
}

class DioLoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (FlavorConfig.instance?.flavor == Flavor.DEVELOPMENT) {
      developer.log("--> ${'METHOD:' + options.method.toUpperCase()} "
          "${"" + options.baseUrl + options.path}");

      developer.log('Headers:');
      options.headers.forEach((k, v) {
        developer.log('$k: $v');
      });

      developer.log('queryParameters:');
      options.queryParameters.forEach((k, v) {
        developer.log('$k: $v');
      });

      if (options.data != null) {
        developer.log('Body: ${options.data}');
      }

      developer.log("--> END ${'METHOD:' + options.method.toUpperCase()}");
    }

    // example for add header authorization
    /*if (options.headers.containsKey(requiredToken)) {
      options.headers.remove(requiredToken);
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }*/
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (FlavorConfig.instance?.flavor == Flavor.DEVELOPMENT) {
      developer.log("<-- ${response.statusCode} "
          "${('URL' + response.requestOptions.baseUrl + response.requestOptions.path)}");

      developer.log('Headers:');
      response.headers.forEach((k, v) {
        developer.log('$k: $v');
      });

      developer.log('Response: ${response.data}');
      developer.log('<-- END HTTP');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (FlavorConfig.instance?.flavor == Flavor.DEVELOPMENT) {
      developer.log("<-- ${err.message} "
          "${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
      developer.log(
          "${err.response != null ? err.response?.data : 'Unknown Error'}");
      developer.log('<-- End error');
    }
    return super.onError(err, handler);
  }
}
