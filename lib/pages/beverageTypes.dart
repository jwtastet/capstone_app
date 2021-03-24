import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';
import 'package:capstone_app/classes/BeverageType.dart';

class BeverageType extends StatefulWidget {
  @override
  _BeverageTypeState createState() => _BeverageTypeState();
}

class _BeverageTypeState extends State<BeverageType> {

  Map data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/backgroung_lemon.jpeg"),
      fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("What kind of drink?"),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
          shrinkWrap: true,
            itemCount: data['tables']['beverageTypes'].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        data['selectedIds']['beverageTypeId'] = data['tables']['beverageTypes'][index].id;
                      });
                      print('from beverageTypes to moods, JT 316');
                      print(data);
                      Navigator.pushNamed(context, '/moods', arguments: data );
                    },
                    title: Center(
                      child: Text(
                        data['tables']['beverageTypes'][index].name.toUpperCase(),
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
      )
    );
  }
}