import 'package:flutter/material.dart';
import 'package:capstone_app/pages/home.dart';
import 'package:capstone_app/pages/loading.dart';
import 'package:capstone_app/pages/moods.dart';
import 'package:capstone_app/pages/tastesBeer.dart';
import 'package:capstone_app/pages/beverageTypes.dart';
import 'package:capstone_app/pages/tastesLiquor.dart';
import 'package:capstone_app/pages/tastesWine.dart';
import 'package:capstone_app/pages/tastesNa.dart';
import 'package:capstone_app/pages/tastesAgain.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/': (context) => Loading(),
        '/moods': (context) => Mood(),
        '/beverageTypes': (context) => BeverageType(),
        '/tastesBeer': (context) => TasteBeer(),
        '/tastesLiquor': (context) => TasteLiquor(),
        '/tastesWine': (context) => TasteWine(),
        '/tastesNa': (context) => TasteNa(),
        '/tastesAgain': (context) => TasteAgain(),

      }
  ));
}
