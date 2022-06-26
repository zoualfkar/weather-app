import 'package:equatable/equatable.dart';

class CityEntity extends Equatable{
  int id;
  String name;

  CityEntity({
    required this.id,
    required this.name
});

  @override
  List<Object?> get props => [id,name];
}