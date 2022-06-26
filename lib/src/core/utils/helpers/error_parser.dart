import 'dart:convert';
import 'package:dio/dio.dart';
import '../../common/data/models/error_model/error_model.dart';



ErrorModel errorParse(DioError? error, StackTrace stackTrace) {
  bool isBackendError = false;

  final int? statusCode = error?.response?.statusCode;

  if (statusCode != null && statusCode < 500) {
    isBackendError = true;
  }



  if (isBackendError) {

    print("error backend");
    final Map<String, dynamic> errorResponse =
        json.decode(error?.response?.data! as String) as Map<String, dynamic>;
    final ErrorModel backendErrorData = ErrorModel.fromJson(errorResponse);
    print("error backend2 $backendErrorData");
    return backendErrorData;
  } else {
    final Error localError = Error(message: "You are not connected to the network. Please check if your Wi-Fi is enabled and try again");
    final ErrorModel localErrorData = ErrorModel(error: localError);
    return localErrorData;
  }
}
