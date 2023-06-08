import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/config/util/preferences.dart';
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
  double lat = 0;
  double lon = 0;

  Future getCurrentLocation() async {
    lat = await Prefs.getLat;
    lon = await Prefs.getLong;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation().then((value) => cubit.getForecast(lat, lon, 5));
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
          BlocConsumer<HomeCubit, HomeState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is HomeError) {
                return Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                );
              } else if (state is HomeEmpty) {
                return const Text(
                  'Data Kosong',
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            },
            listener: (context, state) {},
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
