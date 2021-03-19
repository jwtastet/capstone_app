import 'package:flutter/material.dart';
import 'package:capstone_app/classes/TasteFlavor.dart';

class Flavor extends StatefulWidget {
  @override
  _FlavorState createState() => _FlavorState();
}
class _FlavorState extends State<Flavor> {

  Map data;
  List flavorSelections = [];
  List loopFlavors = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int i = 0;
    while (i < data['tables']['tasteFlavors'].length) {
      if(data['tables']['tasteFlavors'][i].tasteId == data['selectedIds']['tasteId']) {
        loopFlavors.add(data['tables']['tasteFlavors'][i]);
      }
      i++ ;
    }
    i = 0;
    while (i < data['tables']['flavors'].length) {
      int n = 0;
      while (n < loopFlavors.length) {
        if(data['tables']['flavors'][i].id == loopFlavors[n].flavorId) {
          flavorSelections.add(data['tables']['flavors'][i]);
        }
        n++;
      }
      i++;
    }
    print(data);

    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/backgroung_lemon.jpeg"),
        fit: BoxFit.cover,
      ),
    ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("What flavor would you like?"),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: flavorSelections.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        data['selectedIds']['flavorId'] = flavorSelections[index].id;
                      });
                      print('from flavors to prescription, JT 316');
                      print(data);
                      Navigator.pushNamed(context, '/prescription', arguments: data );
                    },
                    title: Center(
                      child: Text(
                        flavorSelections[index].name.toUpperCase(),
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