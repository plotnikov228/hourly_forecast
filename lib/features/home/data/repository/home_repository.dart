import 'package:hourly_forecast/features/home/data/datasources/remote_data_source.dart';
import 'package:hourly_forecast/features/home/domain/entities/city.dart';
import 'package:hourly_forecast/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository { // Репозиторий, где реализуется запрос в сеть
  @override
  Future<List<City>> getCityForecast(String city) async{
    HomeRemoteDataSources dataSources = HomeRemoteDataSources();
    return await dataSources.getCityForecast(city);
  }
}