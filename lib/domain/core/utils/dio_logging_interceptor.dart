import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:supplier_drivers/domain/config/flavor_config.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (FlavorConfig.instance?.flavor == Flavor.DEVELOPMENT) {
      if (kDebugMode) {
        print("--> ${'METHOD:' + options.method.toUpperCase()} "
            "${"" + options.baseUrl + options.path}");

        print('Headers:');
        options.headers.forEach((k, v) {
          if (kDebugMode) print('$k: $v');
        });

        print('queryParameters:');
        options.queryParameters.forEach((k, v) {
          if (kDebugMode) print('$k: $v');
        });

        if (options.data != null) {
          print('Body: ${options.data}');
        }

        print("--> END ${'METHOD:' + options.method.toUpperCase()}");
      }
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
      if (kDebugMode) {
        print("<-- ${response.statusCode} "
            "${('URL' + response.requestOptions.baseUrl + response.requestOptions.path)}");

        print('Headers:');
        response.headers.forEach((k, v) {
          if (kDebugMode) print('$k: $v');
        });

        print('Response: ${response.data}');
        print('<-- END HTTP');
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (FlavorConfig.instance?.flavor == Flavor.DEVELOPMENT) {
      if (kDebugMode) {
        print("<-- ${err.message} "
            "${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
        print("${err.response != null ? err.response?.data : 'Unknown Error'}");
        print('<-- End error');
      }
    }
    return super.onError(err, handler);
  }
}
