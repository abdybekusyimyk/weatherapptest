import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapptest/components/home_watch.dart';
import 'package:weatherapptest/components/home_weather_prognos.dart';
import 'package:weatherapptest/constants/api_constants.dart';
import 'package:weatherapptest/models/weather_models.dart';
// import 'package:weatherapptest/theme/custom/color/app_colors.dart';
import 'package:weatherapptest/theme/custom/typography/app_typo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherModel;

  Future<void> weatherLocation() async {
    setState(() {
      weatherModel = null;
    });

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always &&
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        final dio = Dio();
        final response = await dio.get(ApiConst.getLocator(
          lat: position.latitude,
          lon: position.longitude,
        ));
        if (response.statusCode == 200 || response.statusCode == 201) {
          weatherModel = WeatherModel(
            main: response.data['current']['weather'][0]['main'],
            icon: response.data['current']['weather'][0]['icon'],
            temp: response.data['current']['temp'],
            name: response.data['timezone'],
            tempmax: response.data['daily'][0]['temp']['max'],
            tempmin: response.data['daily'][0]['temp']['min'],
          );
        }
        setState(() {});
      }
    } else {
      Position position = await Geolocator.getCurrentPosition();
      final dio = Dio();
      final response = await dio.get(ApiConst.getLocator(
        lat: position.latitude,
        lon: position.longitude,
      ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        weatherModel = WeatherModel(
          main: response.data['current']['weather'][0]['main'],
          icon: response.data['current']['weather'][0]['icon'],
          temp: response.data['current']['temp'],
          name: response.data['timezone'],
          tempmax: response.data['daily'][0]['temp']['max'],
          tempmin: response.data['daily'][0]['temp']['min'],
        );
      }
      setState(() {});
    }
  }

  Future<void> weatherName() async {
    final dio = Dio();
    final response = await dio.get(ApiConst.api());
    if (response.statusCode == 200 || response.statusCode == 201) {
      weatherModel = WeatherModel(
        main: response.data['weather'][0]['main'],
        icon: response.data['weather'][0]['icon'],
        temp: response.data['main']['temp'],
        name: response.data['name'],
        tempmax: response.data['main']['temp_max'],
        tempmin: response.data['main']['temp_min'],
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    weatherName();
    weatherLocation();
    super.initState();
  }

  dynamic temp(double? temp) {
    return (temp! - 273.15).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return weatherModel == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                      onTap: () {
                        weatherLocation();
                        // showBottomSheet();
                      },
                      child: SvgPicture.asset('assets/icons/pin.svg')),
                  const SizedBox(width: 10),
                  Text(
                    weatherModel!.name!,
                    // 'Архангельск, Россия',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xff010010),
                    Color(0xff01004A),
                    Color(0xff0500B0),
                    Color(0xff0700F7)
                  ],
                ),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Spacer(),
                  const SizedBox(height: 85),
                  Image.network(ApiConst.getIcon(weatherModel!.icon, 4)),
                  // Image.asset('assets/images/Property 1=Default.png'),
                  Column(
                    children: [
                      Text('${temp(weatherModel!.temp)}º',
                          style: AppTextStyle.homeGradustypo),
                      // const SizedBox(height: 5),
                      Text(
                        weatherModel!.main!,
                        style: AppTextStyle.size17Roboto,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Макс: ${temp(weatherModel!.tempmax!).truncate()}º   Мин: ${temp(weatherModel!.tempmin!).truncate()}º',
                        style: AppTextStyle.size17Roboto,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const HomeWatch(),
                  const SizedBox(height: 30),

                  const HomeWeatherPrognos()
                ],
              ),
            ),
          );
  }
}
