import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/config/route/app_route.gr.dart';
import 'package:weather_forecast_app/config/services/injection.dart';
import 'package:weather_forecast_app/presentation/pages/home/home_cubit.dart';
import 'package:weather_forecast_app/presentation/pages/home/home_state.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  var cubit = getIt<HomeCubit>();
  bool isGranted = false;

  @override
  void initState() {
    super.initState();
  }

  Widget bloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is LocationGet) {
          Timer(const Duration(seconds: 2), () {
            context.router.replace(const HomePage());
          });
        }
        return bodyView();
      },
      listener: (context, state) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return bloc();
  }

  Widget bodyView() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: TextButton(
            onPressed: () {
              cubit.getLocation();
            },
            child: const Text('Test')),
      ),
    );
  }
}
