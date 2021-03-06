import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';

class BeverageType extends StatefulWidget {
  @override
  _BeverageTypeState createState() => _BeverageTypeState();
}

class _BeverageTypeState extends State<BeverageType> {

  Map data;

  int moodId = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Select the mood you are in."),
        centerTitle: true,
        elevation: 1,
      ),
    );
  }
}