import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';

class BeverageType extends StatefulWidget {
  @override
  _BeverageTypeState createState() => _BeverageTypeState();
}

class _BeverageTypeState extends State<BeverageType> {

  Map data;
  Map<String, int> selectedIds = {};

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
        title: Text("What kind of drink?"),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: data['beverageTypes'].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      selectedIds['beverageTypeId'] = data['beverageTypes'][index].id;
                    });
                    print(data);
                    Navigator.pushNamed(context, '/moods', arguments: { 'tables': data, 'selectedIds': selectedIds } );
                  },
                  title: Center(
                    child: Text(
                      data['beverageTypes'][index].name,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}