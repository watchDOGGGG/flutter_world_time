// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
import 'Pages/home.dart';
import 'Pages/loading.dart';
import 'Pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home':(context) => HomeScreen(),
      '/location':(context) => ChooseLocation()
    },
  ));
}

