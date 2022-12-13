import 'package:hourly_forecast/features/home/domain/entities/city.dart';

abstract class CityForecastsListEvent {}

class SetupCityForecastsListEvent extends CityForecastsListEvent {
  final List<City> list;

  SetupCityForecastsListEvent(this.list);
}