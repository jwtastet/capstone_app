import 'package:flutter/material.dart';
import 'package:capstone_app/classes/Mood.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}
class _MoodState extends State<Mood> {

  List<dynamic> moods = [];

  int moodId = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    moods = ModalRoute.of(context).settings.arguments;
    print(moods);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Select the mood you are in."),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: moods.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          moodId = moods[index].id;
                        });
                        Navigator.pushNamed(context, '/tastes', arguments: { moods, moodId });
                      },
                      title: Center(
                        child: Text(
                          moods[index].name,
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