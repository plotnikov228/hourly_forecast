import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_forecast_list_bloc/bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_forecast_list_bloc/event.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_forecast_list_bloc/state.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/presentation/city_forecasts_list_page.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityForecastsListBlocPage extends StatelessWidget { //Bloc составляющая страницы CityPage
  final String cityName;
  List<City> cityForecasts;

  CityForecastsListBlocPage(
      {Key? key, required this.cityName, required this.cityForecasts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${cityName[0].toUpperCase()}${cityName.substring(1).toLowerCase()}'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => CityForecastsListBloc(LoadingCityForecastsListState())..add(SetupCityForecastsListEvent(cityForecasts)),
        child: BlocBuilder<CityForecastsListBloc, CityForecastsListState>(
          builder: (BuildContext context, state) {
            if (state is InitialCityForecastsListState) {
              return CityForecastsListPage(
                cityForecasts: state.list,
                cityName: cityName,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}