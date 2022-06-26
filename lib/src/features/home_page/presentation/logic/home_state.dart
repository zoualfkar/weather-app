
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';

part 'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState{


  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.data(dynamic data) = _Data;


  const factory HomeState.error({required ErrorModel errorModel}) = _Error;
}

