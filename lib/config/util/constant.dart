// ignore_for_file: constant_identifier_names

class Constant {
  static String appName = 'WeatherForecastApp';

  static String getCity = 'geo/1.0/direct?';

  //TYPE REST API
  static const String get = 'GET';
  static const String post = 'POST';

  //RESPONSE CODE
  static const String R_SUCCESS = '00';
  static const String R_TIMEOUT = 'SE';
  static const String R_REFUSED = 'Connection refused';
  static const String R_FAILED = 'Connection failed';
  static const String R_SOCKET_EXC = 'SocketException';
  static const String R_EXCEPT = 'Exception:';
  static const String R_RESPONSE = 'DioErrorType.response';
  static const String R_CONNECTING_TIME_OUT = 'DioErrorType.connectTimeout';
  static const String R_SERVICE_UNAVAILABLE = '503';
  static const String R_OTHER_TYPE = 'DioErrorType.other';
}
