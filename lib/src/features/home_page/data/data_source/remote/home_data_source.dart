import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/src/core/utils/managers/http/http_manager.dart';

import '../../../../../core/utils/managers/http/http_methods.dart';

abstract class HomeDataSource{
  Future<Map<String,dynamic>> getWeather();
}

class HomeDataSourceImpl extends HomeDataSource{

  HttpManager httpManager;


  HomeDataSourceImpl({required this.httpManager});

  @override
  Future<Map<String, dynamic>> getWeather() async{
    final Response response = await httpManager.request(
        path: "https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=0da254e4e1b5e88fb77f9c7ca0ff24a9&units=metric",
        method: HttpMethods.Get,
        headers: {}
    );
    return json.decode(response.data as String) as Map<String, dynamic>;
  }

}