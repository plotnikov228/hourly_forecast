import 'package:hourly_forecast/features/home/domain/entities/city.dart';

abstract class HomeRepository {

Future<List<City>> getCityForecast(String city);
}