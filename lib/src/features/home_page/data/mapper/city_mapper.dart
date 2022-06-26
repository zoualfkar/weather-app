import 'package:weather_app/src/features/home_page/data/models/city_model.dart';
import 'package:weather_app/src/features/home_page/domain/entities/city_entity.dart';

class CityMapper{

  CityModel cityModel;

  CityMapper(this.cityModel);

  CityEntity toEntity(){
    return CityEntity(
        id: cityModel.id  ??0,
        name: cityModel.name??''
    );
  }
}