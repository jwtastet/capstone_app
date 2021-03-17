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
          Container(height: 25),
          Text('Thank you for using my Capstone app!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          )),
          Container(
            height: 50,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              width: 300,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  print('lets get started, JT 316');
                  Navigator.pushNamed(context, '/beverageTypes', arguments: data);
                },
                child: Text('Find a Drink',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
              ),
            ),
          ]),
          Container(height: 50),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
                width: 300,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    print('lets get started, JT 316');
                    Navigator.pushNamed(context, '/beverageTypes', arguments: data);
                  },
                  child: Text('Spin the Wheel!',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
                ),
              ),
              ]),
        ],
      )
    );
  }
}