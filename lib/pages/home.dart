import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';
import "package:capstone_app/classes/BeverageType.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  Map data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print("data to home page");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Welcome to Drinkr"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          Text('Thank you for using my Capstone app!',
          style: TextStyle(
            fontSize: 25,
          )),

          Expanded(
            child: FittedBox(
              fit: BoxFit.fitWidth, // otherwise the logo will be tiny
              child: ElevatedButton(
                onPressed: () {
                  print('lets get started, JT 316');
                  Navigator.pushNamed(context, '/beverageTypes', arguments: data);
                },
                child: Text('"I am Thirsty!"'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
              ),
            ),
          ),
        ],
      )
    );
  }
}