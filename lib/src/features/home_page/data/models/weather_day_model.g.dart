// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDayModel _$WeatherDayModelFromJson(Map<String, dynamic> json) =>
    WeatherDayModel(
      main: json['main'] == null
          ? null
          : MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['dt_txt'] as String?,
      wind: json['wind'] == null
          ? null
          : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
    );

Map<String, dynamic> _$WeatherDayModelToJson(WeatherDayModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'dt_txt': instance.date,
      'wind': instance.wind,
      'visibility': instance.visibility,
    };
