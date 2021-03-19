import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class TasteAgain extends StatefulWidget {
  @override
  _TasteAgainState createState() => _TasteAgainState();
}
class _TasteAgainState extends State<TasteAgain> {

  Map data;
  List liquorTastes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int i = 0;
    while (i < 4) {
      liquorTastes.add(data['tables']['tastes'][i]);
      i++ ;
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("Select a taste"),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: liquorTastes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        data['selectedIds']['tasteAgainId'] = liquorTastes[index].id;
                      });
                      print('from tastesAgain to flavors, JT 316');
                      print(data);
                      Navigator.pushNamed(context, '/flavors', arguments: data );
                    },
                    title: Center(
                      child: Text(
                        liquorTastes[index].name.toUpperCase(),
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