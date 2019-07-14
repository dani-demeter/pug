import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';

String sport="none";

class GamesPage extends StatefulWidget{
  GamesPage(String selectedSport){
    sport = selectedSport;
  }

  setSport(String selectedSport){
    sport = selectedSport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();

}

class _GamesPageState extends State<GamesPage>{
  int _currentIndex = 0;
  final _pageOptions = [
    HomePage(),
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(sport),
      bottomNavigationBar: Hero(
        tag: 'navbar',
        child: BottomNavigationBar(
          onTap: (int newtab) {
            setState(() {
              _currentIndex = newtab;
            });
          },
          backgroundColor: darkblue,
          selectedItemColor: lightblue,
          unselectedItemColor: ghostwhite,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            )
          ],
        ),
      ),
    );;
  }
}