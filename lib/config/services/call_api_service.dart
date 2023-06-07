import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast_app/config/helper/api_helper.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/constant.dart';
import 'package:weather_forecast_app/domain/entities/global.dart';

@lazySingleton
class CallApiService {
  var apiHelper = getIt<ApiHelper>();
  CallApiService();

  Future<Response<dynamic>> connect(
      String path, Map<String, dynamic> data, String method,
      {Map<String, dynamic>? extra}) async {
    try {
      Response<dynamic> response;

      var requestPath = path;

      getIt<Global>().cancelToken = CancelToken();

      switch (method) {
        case Constant.get:
          response = await apiHelper.get(
              requestPath, data, getIt<Global>().cancelToken, extra);
          break;
        default:
          response = await apiHelper.post(
              requestPath, data, getIt<Global>().cancelToken, extra);
      }

      return response;
    } on DioException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
