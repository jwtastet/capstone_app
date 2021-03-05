import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:capstone_app/classes/Beverage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<List<Mood>> moods;
  Future<List<BeverageType>> beverageTypes;

  Future<List<Mood>> getMoods() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/moods'));

    if (response.statusCode == 200) {
      final List<Mood> moods = moodFromJson(response.body);
      print(moods[0].name);
      return moods;
    } else {
      throw Exception('Failed to load Beverages');
    }
  }

  Future<List<BeverageType>> getBeverageTypes() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/beverageTypes'));

    if (response.statusCode == 200) {
      final List<BeverageType> beverageTypes = beverageTypeFromJson(response.body);
      print(beverageTypes[0].name);
      return beverageTypes;
    } else {
      throw Exception('Failed to load Beverages');
    }
  }

  void doneLoading(moods, beverageTypes) {
    Navigator.pushNamed(context, '/home', arguments: {moods, beverageTypes});
  }


  @override
  void initState() {
    super.initState();
    moods = getMoods();
    beverageTypes = getBeverageTypes();
    doneLoading(moods, beverageTypes); // TODO!!!!
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRotatingPlain(
        color: Colors.lightBlueAccent,
        size: 50.0,
      ),
    );
  }
}