import 'package:flutter/material.dart';
import 'package:capstone_app/pages/home.dart';
import 'package:capstone_app/pages/loading.dart';
import 'package:capstone_app/pages/moods.dart';
import 'package:capstone_app/pages/tastes.dart';
import 'package:capstone_app/pages/beverageTypes.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/': (context) => Loading(),
        '/moods': (context) => Mood(),
        '/tastes': (context) => BeverageType(),
      }
  ));
}
