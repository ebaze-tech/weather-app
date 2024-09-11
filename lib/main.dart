import 'package:flutter/material.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => Home(),
        '/location': (context) => const ChooseLocation()
      },
    ));
