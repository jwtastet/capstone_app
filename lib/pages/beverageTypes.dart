import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class BeverageType extends StatefulWidget {
  @override
  _BeverageTypeState createState() => _BeverageTypeState();
}
class _BeverageTypeState extends State<BeverageType> {

  List<dynamic> moods = [];

  int moodId = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    moods = ModalRoute.of(context).settings.arguments;
    print(moods);

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