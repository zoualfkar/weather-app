import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';
@JsonSerializable()
class MainModel{

  double? temp;
  @JsonKey(name:'feels_like')
  double? feelsLike;
  @JsonKey(name:'temp_min')
  double? temMin;
  int? pressure;
  @JsonKey(name:'sea_level')
  int? seaLevel;
  @JsonKey(name:'grnd_level')
  int? groundLevel;
  int? humidity;


  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.temMin,
    required this.seaLevel,
    required this.pressure,
    required this.groundLevel,
    required this.humidity
  });


  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);

}