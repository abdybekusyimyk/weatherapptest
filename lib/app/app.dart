import 'package:flutter/material.dart';
import 'package:weatherapptest/modules/auth/auth_page.dart';
import 'package:weatherapptest/modules/auth/first_page.dart';
// import 'package:weatherapptest/modules/auth/first_page.dart';
// import 'package:weatherapptest/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Weather',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
        ),
        // home: const HomePage(),
        // home: const FirstPage(),
        home: const FirstPage());
  }
}
