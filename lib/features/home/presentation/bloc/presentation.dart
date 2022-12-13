
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/bloc.dart';
import 'package:hourly_forecast/features/home/presentation/bloc/state.dart';
import 'package:hourly_forecast/features/home/presentation/presentation/home_page.dart';

class HomeBlocPage extends StatelessWidget {//Bloc составляющая страницы HomePage
  const HomeBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (BuildContext context) => HomeBloc(InitialHomeState()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (BuildContext context, state) {
        if (state is InitialHomeState) {
          return HomePage(buttonChild: Row(children: const [
            Text('Search'),
            Icon(Icons.search)
          ]),);
        }
        else {
          return const HomePage(buttonChild: CircularProgressIndicator(color: Colors.white,));
        }
      }
      ,),),
    );
  }
}
