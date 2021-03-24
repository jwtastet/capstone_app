import 'package:capstone_app/pages/savedBeverages.dart';
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
import 'package:capstone_app/pages/flavors.dart';
import 'package:capstone_app/pages/prescription.dart';
import 'package:capstone_app/pages/spinTheWheel.dart';
import 'package:capstone_app/pages/nav.dart';
import 'package:capstone_app/pages/profile.dart';
import 'package:capstone_app/pages/login.dart';
import 'package:capstone_app/pages/savedBeverages.dart';
import 'package:capstone_app/pages/showSavedBeverage.dart';

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
        '/flavors': (context) => Flavor(),
        '/prescription': (context) => Prescription(),
        '/spinTheWheel': (context) => SpinTheWheel(),
        '/nav': (context) => Nav(),
        '/profile': (context) => Profile(),
        '/login': (context) => Login(),
        '/savedBeverages': (context) => SavedBeverages(),
        '/showSavedBeverage': (context) => ShowSavedBeverage(),

      }
  ));
}

