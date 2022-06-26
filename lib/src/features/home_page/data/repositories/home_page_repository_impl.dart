import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/common/data/models/error_model/error_model.dart';
import 'package:weather_app/src/features/home_page/data/data_source/remote/home_data_source.dart';
import 'package:weather_app/src/features/home_page/data/mapper/city_mapper.dart';
import 'package:weather_app/src/features/home_page/data/mapper/weather_day_mapper.dart';
import 'package:weather_app/src/features/home_page/data/models/city_model.dart';
import 'package:weather_app/src/features/home_page/domain/entities/city_entity.dart';
import 'package:weather_app/src/features/home_page/domain/entities/weather_day_entity.dart';
import 'package:weather_app/src/features/home_page/domain/repositories/home_page_repository.dart';

import '../../../../core/utils/helpers/error_parser.dart';
import '../models/weather_day_model.dart';

class HomeRepositoryImpl extends HomeRepository{

  HomeDataSource homeDataSource;


  HomeRepositoryImpl({
    required this.homeDataSource,
});

  @override
  Future<Either<ErrorModel, dynamic>> getWeather() async{

    try{

      var response = await homeDataSource.getWeather();
      List<WeatherDayModel>  weathersModel =
      (response['list'] as List).map((e) => WeatherDayModel.fromJson(e)).toList();

      CityModel cityModel = CityModel.fromJson(response['city']);

      List<WeatherDayEntity> weathersEntity =
      weathersModel.map((e) => WeatherDayMapper(e).toEntity()).toList();

      CityEntity cityEntity = CityMapper(cityModel).toEntity();


       return right([cityEntity,weathersEntity]);

    }on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    }
  }

}