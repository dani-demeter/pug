import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';

int appCurrentIndex = 0;
final appPageOptions = [
  HomePage(),
  Container(color: Colors.red),
  Container(color: Colors.blue),
];


class MyNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int newtab) {
        print("new tab tapped: " + newtab.toString());
        appPage.getState().setState(() {
          appCurrentIndex = newtab;
        });
      },
      backgroundColor: darkblue,
      selectedItemColor: lightblue,
      unselectedItemColor: ghostwhite,
      type: BottomNavigationBarType.fixed,
      currentIndex: appCurrentIndex,
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
    );
  }

}

class AppPage extends StatefulWidget {
  _AppPageState state;

  getState() {
    return state;
  }

  @override
  _AppPageState createState() {
    state = _AppPageState();
    return state;
  }
}

class _AppPageState extends State<AppPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appPageOptions[appCurrentIndex],
      bottomNavigationBar: Hero(
        tag: 'navbar',
        child: MyNavBar(),
      ),
    );
  }
}
