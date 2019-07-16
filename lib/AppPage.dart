import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';
import 'SearchPage.dart';

int appCurrentIndex = 0;
HomePage homePage = HomePage();
SearchPage searchPage = SearchPage();
final appPageOptions = [
  homePage,
  searchPage,
  Container(color: Colors.blue),
];

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

Future<bool> _willPopCallback() async {
  if (pageDepth != 0) {
    pageDepth -= 1;
    searchPage.getState().setState();
    homePage.getState().setState();
    print("supposed to rebuild everything");
    appPage.getState().setState();
  } else {
    return true;
  }
}

class _AppPageState extends State<AppPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: appPageOptions[appCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int newtab) {
            setState(() {
              pageDepth = 0;
              appCurrentIndex = newtab;
            });
          },
          backgroundColor: contrast,
          selectedItemColor: common,
          unselectedItemColor: primary,
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
        ),
      ),
    );
  }
}
