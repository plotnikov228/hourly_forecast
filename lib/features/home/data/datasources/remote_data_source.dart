import 'dart:convert';
import 'package:hourly_forecast/features/home/data/models/city.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDataSources { // Запрос в сеть
  final String apiKey = '13578e1c3ab6e881e3d8f92361192dfa';

  Future<List<City>> getCityForecast(String city) async {
    final response =
    await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/forecast?q=$city&mode=json&appid=$apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> cityJson = jsonDecode(response.body)['list'];
      return cityJson.map((e) => CityModel.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}