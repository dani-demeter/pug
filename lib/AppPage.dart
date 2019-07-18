import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';
import 'SearchPage.dart';

int appCurrentIndex = 0;

bool changedTabs = false;
int appPrevIndex = 0;
HomePage homePage = HomePage();
SearchPage searchPage = SearchPage();
final appPageOptions = [
  homePage,
  searchPage,
  Container(color: Colors.blue),
];
List pageStack = [[],[],[]];
List pageCatalogue = [homePage, searchPage, Container(color: Colors.blue,)];

class AppPage extends StatefulWidget {

  @override
  _AppPageState createState() => _AppPageState();
}

Future<bool> _willPopCallback() async {
  if (pageDepth.value != 0) {
    pageDepth.value--;
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
              pageDepth.value = 0;
              appPrevIndex = appCurrentIndex;
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
