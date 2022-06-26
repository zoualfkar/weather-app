
import 'package:dartz/dartz.dart';
import 'package:weather_app/src/features/home_page/domain/repositories/home_page_repository.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';

class GetWeather{
  GetWeather({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<ErrorModel, dynamic>> call() {
    return repository.getWeather();
  }
}