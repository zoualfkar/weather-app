import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../app/logic/app_settings.dart';


import '../../../../injections.dart';
import '../database/database_manager.dart';
import 'http_methods.dart';

abstract class HttpManager {
  Future<Response> request({
    required String path,
    required HttpMethods method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  });
  void runPerformanceLog();
}

class HttpManagerImpl implements HttpManager {
  late final Dio _dio;
  late final Dio _authDio;
  late final DatabaseManager _databaseManager;

  late bool isPerformanceLogActive;



  HttpManagerImpl({
    required BaseOptions baseOptions,
    required DatabaseManager databaseManager,
  }) {
    initHttpManager(
      baseOptions: baseOptions,
      databaseManager: databaseManager,
    );
  }

  Future<void> initHttpManager({
    required BaseOptions baseOptions,
    required DatabaseManager databaseManager,
  }) async {
    _dio = Dio(baseOptions);
    _authDio = Dio(baseOptions);
    _databaseManager = databaseManager;

    _authDio.interceptors.addAll([
      _setBaseUrlInterceptor(),
      _logInterceptor(),
    ]);

    _dio.interceptors.addAll([
      _setBaseUrlInterceptor(),
      _logInterceptor(),
    ]);

    final bool isConnected =
        serviceLocator<AppSettings>().hasConnection ?? false;

    isPerformanceLogActive = isConnected;

    if (!isPerformanceLogActive) return;
  }

  @override
  Future<Response> request({
    required String path,
    required HttpMethods method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  }) async {

    if(headers ==null){
      headers={
        'Authorization': 'Bearer ${serviceLocator<AppSettings>().token}'
      };
    }

    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    if (params != null) {
      _dio.options.queryParameters.addAll(params);
    }

    switch (method) {
      case HttpMethods.Get:
        return _dio.get(path);
      case HttpMethods.Post:
        return _dio.post(path,
            data: isFormData ? FormData.fromMap(params!) : params,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress);
      case HttpMethods.Put:
        return _dio.put(path,
            data: isFormData ? FormData.fromMap(params!) : params);
      case HttpMethods.Delete:
        return _dio.delete(path);
      case HttpMethods.Patch:
        return _dio.patch(
          path,
          data: isFormData ? FormData.fromMap(params!) : params,
        );
    }
  }

  @override
  void runPerformanceLog() {
    if (!isPerformanceLogActive) {
      isPerformanceLogActive = true;
    }
  }


}

extension HttpManagerImplHelpers on HttpManagerImpl {
  InterceptorsWrapper _setBaseUrlInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.baseUrl = serviceLocator<AppSettings>().apiBaseUrl ?? "";

        debugPrint(
          'Call: => BASE: ${options.baseUrl}',
        );

        return handler.next(options);
      },
    );
  }

  InterceptorsWrapper _logInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        debugPrint(
          'Call: => PATH: ${options.path}',
        );
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
        );
        return handler.next(response);
      },
      onError: (DioError err, handler) async {
        print(err.response);
        debugPrint(
          'ERROR[${err.response?.statusCode ?? 0}] => PATH: ${err.requestOptions.path}',
        );

        return handler.next(err);
      },
    );
  }
}
