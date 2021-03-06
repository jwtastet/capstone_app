import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:capstone_app/classes/Beverage.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Mood> moods;
  List<BeverageType> beverageTypes;

  void getMoods() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/moods'));

    if (response.statusCode == 200) {
      moods = moodFromJson(response.body);
      print(moods[0].name);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Beverages');
    }
  }

  void getBeverageTypes() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/beverageTypes'));

    if (response.statusCode == 200) {
      beverageTypes = beverageTypeFromJson(response.body);
      print(beverageTypes[0].name);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Beverages');
    }
  }

  void checkForDoneLoading() {
    if (moods.length == 0 || beverageTypes.length == 0) {
      return;
    }
    print("We made it");
    Navigator.pushNamed(context, '/home', arguments: {moods, beverageTypes});
  }


  @override
  void initState() {
    super.initState();
    getMoods();
    getBeverageTypes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}