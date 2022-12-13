import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityModel extends City { // Модель города, по которой мы делаем запрос в сеть
  CityModel(
      {required super.windSpeed, required super.temp, required super.humidity, required super.date});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        windSpeed: double.tryParse(json['wind']['speed'].toString())!,
        temp: double.tryParse(json['main']['temp'].toString())!,
        humidity: double.tryParse(json['main']['humidity'].toString())!,
        date: DateTime.tryParse(json['dt_txt'])!
    );
  }
}
