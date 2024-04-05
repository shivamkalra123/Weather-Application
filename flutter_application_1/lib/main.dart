import 'dart:ui';

import 'package:flutter_application_1/weather_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Center(child: SafeArea(child: Text("Hello Flutter!!")))
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: WeatherScreen(),
    );
  }
}
