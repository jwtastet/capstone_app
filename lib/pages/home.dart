import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  List<dynamic> moods = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    moods = ModalRoute.of(context).settings.arguments;
    print(moods);

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
                  Navigator.pushNamed(context, '/moods', arguments: moods);
                },
                child: Text('"I am thirsty!"'),
              ),
            ),
          ),
        ],
      )
    );
  }
}