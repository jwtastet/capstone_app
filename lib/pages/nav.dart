
import 'package:flutter/material.dart';
import 'package:capstone_app/pages/home.dart';
import 'package:capstone_app/pages/login.dart';
import 'package:capstone_app/pages/profile.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool isLoggedIn;
  int _selectedIndex = 0;


  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Login(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:
              'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label:
              'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        backgroundColor: Colors.lightBlueAccent,
        fixedColor: Colors.white,
      ),
    );
  }
}