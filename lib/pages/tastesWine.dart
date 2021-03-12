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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Select a taste"),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: wineTastes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      data['selectedIds']['tasteId'] = wineTastes[index].id;
                    });
                    print('from moods to tastes, JT 316');
                    print(data);
                    Navigator.pushNamed(context, '/tastes', arguments: data );
                  },
                  title: Center(
                    child: Text(
                      wineTastes[index].name,
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