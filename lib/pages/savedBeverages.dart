import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:capstone_app/classes/Beverage.dart';

class SavedBeverages extends StatefulWidget {
  @override
  _SavedBeveragesState createState() => _SavedBeveragesState();
}


class _SavedBeveragesState extends State<SavedBeverages> {

  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Saved Beverages"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.teal],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          data['selectedIds']['savedBeverageId'] = index + 1;
                        });
                        print('too savedbeverage, JT 316');
                        print(data);
                        Navigator.pushNamed(context, '/showSavedBeverage', arguments: data );
                      },
                      title: Center(
                        child: Text(
                          data['tables']['beverages'][index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
      ),
    );
  }
}
