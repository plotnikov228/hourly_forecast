import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_forecast_list_bloc/event.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_forecast_list_bloc/state.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityForecastsListBloc extends Bloc<CityForecastsListEvent, CityForecastsListState>{
  CityForecastsListBloc(super.initialState){
// Функция для сортировки списка (за 3 дня, самая низка температура отображается первой)
    List<City> sortList(List<City> cityForecasts) {
      compare(City a, City b) => a.temp.compareTo(b.temp);
      List<int> days = [];
      List<City> cityForecastsForSort = [];

      for (City item in cityForecasts) {
        if (days.contains(item.date.day) == false) {
          days.add(item.date.day);
          if(days.length > 3) break;
        }
        cityForecastsForSort.add(item);

      }
      cityForecastsForSort.sort(compare);
      return cityForecastsForSort;
    }

    on<SetupCityForecastsListEvent>((event, emit) {
      emit(InitialCityForecastsListState(sortList(event.list)));
    });

  }
}