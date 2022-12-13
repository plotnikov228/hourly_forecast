import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/bloc.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/event.dart';

class HomePage extends StatelessWidget {
  final Widget buttonChild; // В HomeBlocPage передаёт либо прогресс индикатор, либо Текст "Search"
  const HomePage({Key? key, required this.buttonChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var cityTextController = TextEditingController();
    RegExp regex = RegExp('^[a-zA-Z]+\$');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    'Get City Forecast',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 32),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  onFieldSubmitted: (text) {
                    if (formKey.currentState!.validate()) { //Если прошли валедацию формы, то делаем запрос в сеть
                      context.read<HomeBloc>().add(SearchCityEvent(
                          cityTextController.text.trim(), context));
                    }
                  },
                  controller: cityTextController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text('City name')),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field should not be empty!';
                    }
                    if (!regex.hasMatch(value)) { // Только латиница
                      return 'The name of the city should be written in Latin!';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) { //Если прошли валедацию формы, то делаем запрос в сеть
                        context.read<HomeBloc>().add(SearchCityEvent(
                            cityTextController.text.trim(), context));
                      }
                    },
                    child:buttonChild
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
