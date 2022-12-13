import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/event.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/bloc/city_bloc/state.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/presentation/city_forecasts_list_page.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityBloc extends Bloc<CityEvent, CityState>{
  CityBloc(super.initialState){
  }
}