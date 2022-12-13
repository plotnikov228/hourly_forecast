import 'package:hourly_forecast/features/home/domain/entities/city.dart';

abstract class CityForecastsListState {}

class InitialCityForecastsListState extends CityForecastsListState{
  final List<City> list;

  InitialCityForecastsListState(this.list);
}

class LoadingCityForecastsListState extends CityForecastsListState {}