import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/event.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/state.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/presentation/city_page.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityBlocPage extends StatelessWidget { //Bloc составляющая страницы CityPage
  final String cityName;
  List<City> cityForecasts;

   CityBlocPage(
      {Key? key, required this.cityName, required this.cityForecasts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CityBloc(InitialCityState()),
      child: BlocBuilder<CityBloc, CityState>(
        builder: (BuildContext context, state) {
          if (state is InitialCityState) {
            return CityPage(
              cityForecasts: cityForecasts,
              cityName: cityName,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
