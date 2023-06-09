// ignore_for_file: constant_identifier_names

class Constant {
  static String appName = 'WeatherForecastApp';

  static String getCity = 'geo/1.0/direct?';
  static String getForecast = 'data/2.5/forecast?';

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

class ConstantWeather {
  static const CLEAR = '01d';
  static const CLEAR2 = '01n';
  static const FEWCLOUDS = '02d';
  static const FEWCLOUDS2 = '02n';
  static const SCATTEREDCLOUDS = '03d';
  static const SCATTEREDCLOUDS2 = '03n';
  static const BROKENCLOUDS = '04d';
  static const BROKENCLOUDS2 = '04n';
  static const SHOWERRAIN = '09d';
  static const SHOWERRAIN2 = '09n';
  static const RAIN = '10d';
  static const RAIN2 = '10n';
  static const THUNDERSTORM = '11d';
  static const THUNDERSTORM2 = '11n';
  static const SNOW = '13d';
  static const SNOW2 = '13n';
  static const MIST = '50d';
  static const MIST2 = '50n';
}
