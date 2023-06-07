import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/services/interceptor.dart';
import 'package:weather_forecast_app/config/util/app_config.dart';

@lazySingleton
class ApiHelper {
  late Dio dio;

  String apiKey = "&appId=${AppConfig.apiKey}";

  ApiHelper() {
    dio = Dio();
    dio.options.baseUrl = AppConfig.currentUrl;
    dio.options.connectTimeout = AppConfig.connectTimeout;
    dio.options.receiveTimeout = AppConfig.receiveTimeout;
    dio.options.responseType = ResponseType.json;
    dio.interceptors.add(AppInterceptors());
  }

  Future<Response<T>> post<T>(String url, Map<String, dynamic> data,
      CancelToken cancelToken, Map<String, dynamic>? extra) {
    dio.options.extra = extra ?? {};
    return dio.post(url + apiKey, data: data, cancelToken: cancelToken);
  }

  Future<Response<T>> get<T>(String url, Map<String, dynamic> data,
      CancelToken cancelToken, Map<String, dynamic>? extra) {
    dio.options.extra = extra ?? {};
    return dio.get(url + apiKey,
        queryParameters: data, cancelToken: cancelToken);
  }

  Future<Response<T>> upload<T>(String url, FormData data,
      CancelToken cancelToken, Map<String, dynamic>? extra) {
    dio.options.extra = extra ?? {};
    return dio.post(url + apiKey, data: data, cancelToken: cancelToken);
  }

  Future<Response> download<T>(String url, String savingPath,
      Function(int, int) progress, CancelToken cancelToken) {
    return dio.download(url + apiKey, savingPath,
        onReceiveProgress: progress, cancelToken: cancelToken);
  }
}
