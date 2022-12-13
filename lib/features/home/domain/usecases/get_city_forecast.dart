import 'package:hourly_forecast/features/home/domain/entities/city.dart';
import 'package:hourly_forecast/features/home/domain/repository/home_repository.dart';

class GetCityForecast {
  final HomeRepository repository;

  GetCityForecast(this.repository);

  Future<List<City>> getCityForecast(String city) async{
    return await repository.getCityForecast(city);
  }
}