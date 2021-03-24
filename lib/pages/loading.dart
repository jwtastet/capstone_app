import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:capstone_app/classes/Beverage.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';
import 'package:capstone_app/classes/Prescription.dart';
import 'package:capstone_app/classes/Taste.dart';
import 'package:capstone_app/classes/Flavor.dart';
import 'package:capstone_app/classes/TasteFlavor.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Mood> moods = [];
  List<BeverageType> beverageTypes = [];
  List<Prescription> prescriptions = [];
  List<Taste> tastes = [];
  List<Flavor> flavors = [];
  List<TasteFlavor> tasteFlavors = [];
  List<Beverage> beverages = [];

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

  void getFlavors() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/flavors'));

    if (response.statusCode == 200) {
      flavors = flavorFromJson(response.body);
      print(flavors);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load Flavors');
    }
  }

  void getTasteFlavors() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/tasteFlavors'));

    if (response.statusCode == 200) {
      tasteFlavors = tasteFlavorFromJson(response.body);
      print(tasteFlavors);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load TasteFlavors');
    }
  }

  void getBeverages() async {
    final response =
    await get(Uri.https('pure-taiga-78029.herokuapp.com', 'api/beverages'));

    if (response.statusCode == 200) {
      beverages = beverageFromJson(response.body);
      print(beverages);
      checkForDoneLoading();
    } else {
      throw Exception('Failed to load TasteFlavors');
    }
  }

  void checkForDoneLoading() {
    if (moods.isEmpty || beverageTypes.isEmpty || prescriptions.isEmpty || tastes.isEmpty || flavors.isEmpty || tasteFlavors.isEmpty) {
      return;
    }
    print("We made it");
    Navigator.pushReplacementNamed(context, '/nav', arguments: {"tables": {"moods": moods, "beverageTypes": beverageTypes, "prescriptions": prescriptions, "tastes": tastes, "tasteFlavors": tasteFlavors, "flavors": flavors, "beverages": beverages}, "selectedIds": {}, "isLoggedIn": false, "userId": 1});
  }


  @override
  void initState() {
    super.initState();
    getMoods();
    getBeverageTypes();
    getPrescriptions();
    getTastes();
    getFlavors();
    getTasteFlavors();
    getBeverages();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: new InkWell(
          child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Container(
                decoration: BoxDecoration(color: Colors.black),
                ),
                new Container(
                  child: Image.asset('assets/images/background_image.jpeg', fit: BoxFit.cover),
                ),
                new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                new Expanded(
                  flex: 3,
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                        ),
                       ],
                      ) ),
                     ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.lightBlueAccent),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          )
                          ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
