import 'package:equatable/equatable.dart';

class WeatherDayEntity extends Equatable{

  double temp;
  double minTemp;
  String weatherMain;
  String weatherDes;
  String icon;
  String date;
  double wind;
  int humidity;
  double feelsLike;
  int   visibility;
  int groundLevel;
  int seeLevel;
  int pressure;



  WeatherDayEntity({
    required this.temp,
    required this.minTemp,
    required this.weatherMain,
    required this.weatherDes,
    required this.icon,
    required this.date,
    required this.wind,
    required this.humidity,
    required this.feelsLike,
    required this.visibility,
    required this.groundLevel,
    required this.seeLevel,
    required this.pressure,
  });

  @override
  List<Object?> get props => [
    temp,
    minTemp,
    weatherMain,
    icon,
    date,
    wind,
    humidity,
    feelsLike,
    visibility,
    groundLevel,
    seeLevel,
    pressure,
  ];

}