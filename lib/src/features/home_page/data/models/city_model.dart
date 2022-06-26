import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';
@JsonSerializable()
class CityModel{

  int? id;
  String? name;

  CityModel({
    required this.id,
    required this.name
});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

}