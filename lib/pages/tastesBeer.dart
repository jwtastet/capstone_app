import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class TasteBeer extends StatefulWidget {
  @override
  _TasteBeerState createState() => _TasteBeerState();
}
class _TasteBeerState extends State<TasteBeer> {

  Map data;
  List beerTastes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    int i = 0;
    while (i < 4) {
      beerTastes.add(data['tables']['tastes'][i]);
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
          title: Text("How do you want it to taste?"),
          centerTitle: true,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: beerTastes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        data['selectedIds']['tasteId'] = beerTastes[index].id;
                      });
                      print('from moods to tastes, JT 316');
                      print(data);
                      Navigator.pushNamed(context, '/flavors', arguments: data );
                    },
                    title: Center(
                      child: Text(
                        beerTastes[index].name.toUpperCase(),
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