import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';

import '../../domain/usecases/get_current_weather.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
      final cityName = event.cityName;

      emit(WeatherLoading());

      final result = await _getCurrentWeather.execute(cityName);
      result.fold(
            (failure) {
          emit(WeatherError(failure.message));
        },
            (data) {
          emit(WeatherHasData(data));
        },
      );
    });
  }
}