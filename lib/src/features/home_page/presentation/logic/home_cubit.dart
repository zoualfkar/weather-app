import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/src/core/common/data/models/error_model/error_model.dart';
import 'package:weather_app/src/features/home_page/domain/use_case/get_weather.dart';

import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {

  GetWeather getWeather;


  HomeCubit({
    required this.getWeather,
}) : super(const  HomeState.initial());


  doGetWeather()async{

    emit(const HomeState.loading());

    Either<ErrorModel,dynamic> data =await getWeather();

    var state = data.fold((error) => HomeState.error(errorModel: error),
            (data) => HomeState.data(data));
    
    emit(state);
  }
}
