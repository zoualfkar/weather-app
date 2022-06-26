import 'package:weather_app/src/features/home_page/domain/entities/weather_day_entity.dart';

import '../models/weather_day_model.dart';

class WeatherDayMapper{

  WeatherDayModel weatherDayModel;

  WeatherDayMapper(this.weatherDayModel);


 WeatherDayEntity toEntity(){

   return WeatherDayEntity(
     temp: weatherDayModel.main?.temp?? 0,
     minTemp: weatherDayModel.main?.temMin??0,
     icon:  weatherDayModel.weather?[0].icon?? '',
     weatherMain: weatherDayModel.weather?[0].main?? '',
     weatherDes: weatherDayModel.weather?[0].description?? '',
     date: weatherDayModel.date?? '',
     wind: weatherDayModel.wind?.speed??0,
     visibility:  weatherDayModel.visibility??0,
     humidity: weatherDayModel.main?.humidity??0,
     feelsLike:  weatherDayModel.main?.feelsLike??0,
     groundLevel:  weatherDayModel.main?.groundLevel??0,
     seeLevel:  weatherDayModel.main?.seaLevel??0,
     pressure:  weatherDayModel.main?.pressure??0,

   );

  }
}