import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:weather_app/data/datasources/remote_data_source.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

@GenerateMocks(
  [
    WeatherRepository,
    RemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}