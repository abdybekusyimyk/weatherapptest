import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherapptest/theme/custom/typography/app_typo.dart';

class HomeWatch extends StatelessWidget {
  const HomeWatch({
    super.key,
    // required this.watch, required this.icon, required this.temp,
  });

  // final String watch;
  // final String icon;
  // final String temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white, // Белый фон контейнера
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 180,
            sigmaY: 180,
            tileMode: TileMode.clamp,
          ),
          child: Column(
            children: [
              // const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Сегодня',
                      style: AppTextStyle.size17Roboto,
                    ),
                    Text(
                      '19 август',
                      style: AppTextStyle.typoRoboto15,
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
              const Divider(
                color: Colors.white,
                // height: 2.5,
                thickness: 1.2,
                // indent: 50,
                // endIndent: 0,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const WatchGradus(
                    watch: '14:00',
                    icon: 'assets/icons/CloudMoon.svg',
                    temp: '25º',
                  ),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      width: 75,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white12, width: 0.8),

                        color: Colors.white, // Белый фон контейнера
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 50,
                            sigmaY: 100,
                            tileMode: TileMode.clamp,
                          ),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    const WatchGradus(
                      watch: '15:00',
                      icon: 'assets/icons/CloudRain.svg',
                      temp: '23º',
                    ),
                  ]),
                  const WatchGradus(
                    watch: '17:00',
                    icon: 'assets/icons/CloudSun.svg',
                    temp: '17º',
                  ),
                  const WatchGradus(
                    watch: '17:06',
                    icon: 'assets/icons/CloudSnow.svg',
                    temp: '17º',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WatchGradus extends StatelessWidget {
  const WatchGradus({
    super.key,
    required this.watch,
    required this.icon,
    required this.temp,
  });

  final String watch;
  final String icon;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Spacer(),
        // SizedBox(height: 10),
        Text(
          watch,
          style: AppTextStyle.typoRoboto15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SvgPicture.asset(icon),
        ),
        Text(
          temp,
          style: AppTextStyle.size17Roboto,
        )
      ],
    );
  }
}
