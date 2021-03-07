import 'package:dio/dio.dart';
import 'package:universal_platform/universal_platform.dart';

abstract class BaseNetworkClient {
  static const int CONNECTION_TIMEOUT = 10000; //milliseconds
  static const int RECEIVE_TIMEOUT = 10000; //milliseconds

  static Dio buildHttpAdapter() {
    final Dio dio = Dio();
    final LogInterceptor logging = _getLogInterceptor();
    dio.options.connectTimeout = CONNECTION_TIMEOUT;
    dio.options.receiveTimeout = RECEIVE_TIMEOUT;
    dio.options.headers.addAll(<String, dynamic>{
      'Accept-Encoding': 'gzip',
      'User-Agent': '${platformName()}/0.1.0-1',
    });

    dio.interceptors.add(logging);

    return dio;
  }

  static LogInterceptor _getLogInterceptor() {
    return LogInterceptor(responseBody: true);
  }
}

String platformName() {
  if (UniversalPlatform.isAndroid) {
    return 'Android';
  } else if (UniversalPlatform.isIOS) {
    return 'iOS';
  } else if (UniversalPlatform.isWeb) {
    return 'web';
  } else {
    return 'unknown';
  }
}
