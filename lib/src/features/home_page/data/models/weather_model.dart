
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.g.dart';
@JsonSerializable()
class WeatherModel{

  String? main;
  String? icon;
  String description;


  WeatherModel({
    required this.main,
    required this.icon,
    required this.description
});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);


}