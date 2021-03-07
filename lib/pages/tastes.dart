import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class Taste extends StatefulWidget {
  @override
  _TasteState createState() => _TasteState();
}
class _TasteState extends State<Taste> {

  Map data;

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
        title: Text("Select a taste"),
        centerTitle: true,
        elevation: 1,
      ),
    );
  }
}