import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/src/features/home_page/data/models/main_model.dart';
import 'package:weather_app/src/features/home_page/data/models/wind_model.dart';

import 'weather_model.dart';

part 'weather_day_model.g.dart';

@JsonSerializable()
class WeatherDayModel{

  MainModel? main;
  List<WeatherModel>? weather;

  @JsonKey(name:'dt_txt' )
  String? date;

  WindModel? wind;
  int? visibility;


  WeatherDayModel({
    required this.main,
    required this.weather,
    required this.date,
    required this.wind,
    required this.visibility
});

  factory WeatherDayModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDayModelToJson(this);
}