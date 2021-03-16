import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}
class _MoodState extends State<Mood> {

  Map data;

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
        title: Text("What kind of mood are you in?"),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: data['tables']['moods'].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      data['selectedIds']['moodId'] =
                          data['tables']['moods'][index].id;
                    });
                    if (data['selectedIds']['beverageTypeId'] == 1) {
                      print('from moods to tastesBeer, JT 316');
                      print(data);
                      Navigator.pushNamed(
                          context, '/tastesBeer', arguments: data);
                    } else if (data['selectedIds']['beverageTypeId'] == 2) {
                      print('from moods to tastesLiquor, JT 316');
                      print(data);
                      Navigator.pushNamed(
                          context, '/tastesLiquor', arguments: data);
                    } else if (data['selectedIds']['beverageTypeId'] == 3) {
                      print('from moods to tastesWine, JT 316');
                      print(data);
                      Navigator.pushNamed(
                          context, '/tastesWine', arguments: data);
                    } else if (data['selectedIds']['beverageTypeId'] == 4) {
                      print('from moods to tastesNa, JT 316');
                      print(data);
                      Navigator.pushNamed(
                          context, '/tastesNa', arguments: data);
                    }
                  },
                  title: Center(
                    child: Text(
                      data['tables']['moods'][index].name,
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