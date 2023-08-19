import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:weatherapptest/theme/custom/color/app_colors.dart';
import 'package:weatherapptest/theme/custom/typography/app_typo.dart';

class HomeWeatherPrognos extends StatelessWidget {
  const HomeWeatherPrognos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 180,
            sigmaY: 180,
            // tileMode: TileMode.clamp,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/icons/Wind.svg'),
                    const Spacer(),
                    const Text('2 м/с', style: AppTextStyle.typoWhite20),
                    const Spacer(
                      flex: 6,
                    ),
                    const Text('Ветер северо-восточный',
                        style: AppTextStyle.typoRoboto15),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/Drop.svg'),
                    const Spacer(),
                    const Text('100%', style: AppTextStyle.typoWhite20),
                    const Spacer(
                      flex: 8,
                    ),
                    const Text('Высокая влажность',
                        style: AppTextStyle.typoRoboto15),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
