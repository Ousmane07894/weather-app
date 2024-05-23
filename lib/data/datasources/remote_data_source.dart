import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exceptions.dart';
import '../models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
    await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    log("rs ==============> ${response}");

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}