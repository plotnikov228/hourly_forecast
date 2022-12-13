import 'package:flutter/material.dart';

abstract class HomeEvent {}

class SearchCityEvent extends HomeEvent{
  final String city;
  final BuildContext context;

  SearchCityEvent(this.city, this.context);
}