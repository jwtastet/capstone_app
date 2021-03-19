import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class TasteWine extends StatefulWidget {
  @override
  _TasteWineState createState() => _TasteWineState();
}
class _TasteWineState extends State<TasteWine> {

  Map data;
  List wineTastes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    wineTastes.add(data['tables']['tastes'][1]);
    wineTastes.add(data['tables']['tastes'][4]);
    wineTastes.add(data['tables']['tastes'][5]);
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
          title: Text("How do you want it to taste?"),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: wineTastes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        data['selectedIds']['tasteId'] = wineTastes[index].id;
                      });
                      print('from tastesWine to flavors, JT 316');
                      print(data);
                      Navigator.pushNamed(context, '/flavors', arguments: data );
                    },
                    title: Center(
                      child: Text(
                        wineTastes[index].name.toUpperCase(),
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