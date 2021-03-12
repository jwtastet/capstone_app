import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class TasteLiquor extends StatefulWidget {
  @override
  _TasteLiquorState createState() => _TasteLiquorState();
}
class _TasteLiquorState extends State<TasteLiquor> {

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

    return Scaffold(
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
                child: ListTile(
                  onTap: () {
                    setState(() {
                      data['selectedIds']['tasteId'] = liquorTastes[index].id;
                    });
                    print('from tastesLiquor to tastesAgain, JT 316');
                    print(data);
                    Navigator.pushNamed(context, '/tastesAgain', arguments: data );
                  },
                  title: Center(
                    child: Text(
                      liquorTastes[index].name,
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