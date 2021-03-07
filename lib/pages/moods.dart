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
        title: Text("Select the mood you are in."),
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
                      data['selectedIds']['moodId'] = data['tables']['moods'][index].id;
                    });
                    print(data);
                    Navigator.pushNamed(context, '/tastes', arguments: data );
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