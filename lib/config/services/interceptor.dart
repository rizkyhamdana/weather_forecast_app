import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:weather_forecast_app/config/util/app_config.dart';

class AppInterceptors extends InterceptorsWrapper {
  Response? tempResponse;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var lang = 'ind';
    options.headers['Accept-Language'] = lang;
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    tempResponse = response;

    if (response.requestOptions.data is FormData) {
      if (kDebugMode) {
        try {
          print(
              'request filed : ${(response.requestOptions.data as FormData).fields.toList()}');
          print(
              'request files : ${(response.requestOptions.data as FormData).files.toList()}');
        } catch (e) {
          print(e);
        }
      }
    }

    if (AppConfig.isDebug) {
      log(
        "===============================================\n"
        "URL : ${response.requestOptions.uri}\n"
        "Headers : ${prettyJson(response.requestOptions.headers)}\n"
        "REQUEST : ${response.requestOptions.data is FormData ? '' : prettyJson(response.requestOptions.data ?? response.requestOptions.queryParameters ?? '')}\n"
        "RESPONSE : ${response.data is ResponseBody ? response.data : prettyJson(response.data)}\n"
        "===============================================",
      );
    }
  }
}
