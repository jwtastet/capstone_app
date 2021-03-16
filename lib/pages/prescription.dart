import 'package:capstone_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:capstone_app/classes/TasteFlavor.dart';
import 'package:capstone_app/classes/Beverage.dart';

class Prescription extends StatefulWidget {
  @override
  _PrescriptionState createState() => _PrescriptionState();
}
class _PrescriptionState extends State<Prescription> {

  Map data;
  int beverageId = 0;
  Beverage theChoice;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int i = 0;
    while (i < data['tables']['prescriptions'].length) {
      if(data['selectedIds']['beverageTypeId'] == 2) {
        if(data['tables']['prescriptions'][i].moodId == data['selectedIds']['moodId'] && data['tables']['prescriptions'][i].taste1Id == data['selectedIds']['tasteId'] && data['tables']['prescriptions'][i].taste2Id == data['selectedIds']['tasteAgainId'] && data['tables']['prescriptions'][i].flavorId == data['selectedIds']['flavorId']) {
          beverageId = data['tables']['prescriptions'][i].beverageId;
          print("beverage id is: $beverageId");

        }
      }
      i++;
    }
    i = 0;
    while (i < data['tables']['beverages'].length) {
      if(data['tables']['beverages'][i].id == beverageId) {
        theChoice = data['tables']['beverages'][i];
      }
      i++;
    }
    print(data);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("It's 5 o'clock somewhere!"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      theChoice.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        theChoice.description,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        theChoice.ingredients,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        icon: Icon( Icons.home, color: Colors.lightBlueAccent),
                        label: Text('Back To Home',
                          style: TextStyle(
                            color: Colors.lightBlueAccent
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 5,
            child: Hero(
              tag: theChoice.imageUrl,
              child: Image.network(
                theChoice.imageUrl,
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}