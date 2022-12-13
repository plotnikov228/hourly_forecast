import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/presentation.dart';
import 'package:hourly_forecast/features/home/data/repository/home_repository.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';
import 'package:hourly_forecast/features/home/domain/usecases/get_city_forecast.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/event.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {

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


    // Event поиска, при нажатии кнопки делает запрос в сеть, если всё окей,
    // То переходит на следующую страницу, если нет, то отображает SnackBar с ошибкой и AlertDialog
    on<SearchCityEvent>((event, emit) async {
      emit(LoadingHomeState());
      var getCityForecast = GetCityForecast(HomeRepositoryImpl());
      try {
        await getCityForecast.getCityForecast(event.city);
        var cityForecasts = await getCityForecast.getCityForecast(event.city);

        Navigator.push(
            event.context,
            MaterialPageRoute(
                builder: ((context) => CityBlocPage(
                      cityForecasts: sortList(cityForecasts),
                      cityName: event.city,
                    ))));
        emit(InitialHomeState());
      } catch (error) {

        await showDialog(
          context: event.context,
          builder: (context) => AlertDialog(
            content: const Text(
                'Ошибка получения данных.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(); // dismisses only the dialog and returns nothing
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );

        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(error.toString()),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(event.context).size.height / 2),
        ));

        emit(InitialHomeState());
      }
    });
  }
}
