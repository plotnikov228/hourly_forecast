import 'package:flutter/material.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityForecastsListPage extends StatelessWidget {
  final String cityName;
  final List<City> cityForecasts;
  const CityForecastsListPage({Key? key, required this.cityName, required this.cityForecasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        '${cityName[0].toUpperCase()}${cityName.substring(1).toLowerCase()}'),
      ),
    body: ListView.builder(
        itemCount: cityForecasts.length,
        itemBuilder: (context, index) {

      return Container(
        width: MediaQuery.of(context).size.width - 60,
        color: index.isOdd ? Colors.blue[100] : Colors.transparent,
        child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(16),
             child: Text('Date: ${cityForecasts[index].date}'),
           ),
           Padding(
             padding: const EdgeInsets.all(16),
             child: Text('Temperature: ${cityForecasts[index].temp}'),
           ),
           Padding(
             padding: const EdgeInsets.all(16),
             child: Text('Wind speed: ${cityForecasts[index].windSpeed}'),
           ),
           Padding(
             padding: const EdgeInsets.all(16),
             child: Text('Humidity: ${cityForecasts[index].humidity}'),
           )
         ],
        ),
      );
    }),);
  }
}
