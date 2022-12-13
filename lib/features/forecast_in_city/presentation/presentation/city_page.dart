import 'package:flutter/material.dart';
import 'package:hourly_forecast/features/forecast_in_city/presentation/presentation/city_forecasts_list_page.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';

class CityPage extends StatelessWidget {
  final String cityName;
  final List<City> cityForecasts;

  const CityPage(
      {Key? key, required this.cityForecasts, required this.cityName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( // Кнопка с Navigator.pop создаётся автоматически
          title: Text(
              '${cityName[0].toUpperCase()}${cityName.substring(1).toLowerCase()}'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => CityForecastsListPage(
                              cityName: cityName,
                              cityForecasts: cityForecasts))));
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child:Text(
                'Weather forecast in ${cityName[0].toUpperCase()}${cityName.substring(1).toLowerCase()} today!',
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 24),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Temperature: ${cityForecasts.first.temp}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          Text('Wind speed: ${cityForecasts.first.windSpeed}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Humidity: ${cityForecasts.first.humidity}'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}