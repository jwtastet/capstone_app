import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Profile Page"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
            ),
          child: Column(
            children: <Widget>[
              Container(height: 25),
              Text('Name: Joey',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  )),
              Container(height: 25),
              Text('Email: joey@test.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  )),
              Container(
                height: 350,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    width: 200,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/savedBeverages', arguments: data);
                      },
                      child: Text('Saved Beverages',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
                    ),
                  ),
                  ]),
              Container(
                height: 25,
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        data['isLoggedIn'] = false;
                        Navigator.pushNamed(context, '/nav', arguments: data);
                      },
                      child: Text('Logout',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
                    ),
                  ),
                  ]),
              Container(height: 40),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/nav', arguments: data);
                      },
                      child: Text('Back To Home',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
                    ),
                  ),
                  ]),
            ],
          )
      ),
    );
  }
}
