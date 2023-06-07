import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/presentation/pages/home/home_cubit.dart';
import 'package:weather_forecast_app/presentation/pages/home/home_state.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cubit = getIt<HomeCubit>();
  @override
  void initState() {
    //
    super.initState();
    cubit.getCity('Makassar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Tesst'),
      ),
      body: Column(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state.error != null) {
                return Text(
                  state.error!,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            },
          ),
          TextButton(
              onPressed: () {
                cubit.getCity('1sjaksjakjkqjk');
              },
              child: const Text('Test')),
        ],
      ),
    );
  }
}
