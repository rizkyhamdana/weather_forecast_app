import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/presentation/pages/home/cubit.dart';

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
      body: TextButton(
          onPressed: () {
            cubit.getCity('Makas');
          },
          child: const Text('Test')),
    );
  }
}
