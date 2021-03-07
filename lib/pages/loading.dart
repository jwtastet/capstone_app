import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:capstone_app/classes/Beverage.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';
import 'package:capstone_app/classes/Prescription.dart';
import 'package:capstone_app/classes/Taste.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Mood> moods = [];
  List<BeverageType> beverageTypes = [];
  List<Prescription> prescriptions = [];
  List<Taste> tastes = [];

  void getMoods() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/moods'));

    if (response.statusCode == 200) {
      moods = moodFromJson(response.body);
      print(moods[0].name);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Moods');
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
      throw Exception('Failed to load Beverage Types');
    }
  }

  void getPrescriptions() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/prescriptions'));

    if (response.statusCode == 200) {
      prescriptions = prescriptionFromJson(response.body);
      print(prescriptions);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Prescriptions');
    }
  }

  void getTastes() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/tastes'));

    if (response.statusCode == 200) {
      tastes = tasteFromJson(response.body);
      print(tastes);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Tastes');
    }
  }

  void checkForDoneLoading() {
    if (moods.isEmpty || beverageTypes.isEmpty || prescriptions.isEmpty || tastes.isEmpty) {
      return;
    }
    print("We made it");
    Navigator.pushNamed(context, '/home', arguments: {"moods": moods, "beverageTypes": beverageTypes, "prescriptions": prescriptions, "tastes": tastes});
  }


  @override
  void initState() {
    super.initState();
    getMoods();
    getBeverageTypes();
    getPrescriptions();
    getTastes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}