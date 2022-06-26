import 'package:weather_app/src/core/common/data/models/error_model/error_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{

  Future<Either<ErrorModel,dynamic>> getWeather();

}