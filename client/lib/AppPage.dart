import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'GamesPage.dart';
import 'ProfilePage.dart';
import 'MatchPage.dart';
import 'UserPage.dart';

int appCurrentIndex = 0;

bool changedTabs = false;
int appPrevIndex = 0;
HomePage homePage = HomePage();
SearchPage searchPage = SearchPage();
GamesPage gamesPage = GamesPage();
ProfilePage profilePage = ProfilePage();
MatchPage matchPage = MatchPage();
UserPage userPage = UserPage();
//final appPageOptions = [
//  homePage,
//  searchPage,
//  Container(color: Colors.blue),
//];
List pageCatalogue = [
  homePage,
  searchPage,
  userPage,
  gamesPage,
  profilePage,
  matchPage,
];
// 0 = homePage
// 1 = searchPage
// 2 = userPage
// 3 = gamesPage
// 4 = profilePage
// 5 = matchPage

List<List<dynamic>> pageStack = [
  [
    {"pageIndex": 0}
  ],
  [
    {"pageIndex": 1}
  ],
  [
    {"pageIndex": 2}
  ]
];

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

setupNewPage() {
  var pageData = pageStack[appCurrentIndex][pageDepth.value];
  var pi = pageData['pageIndex'];
  if (pi == 3) {
    pageCatalogue[pi].setSport(pageData["sport"]);
  } else if (pi == 4) {
    pageCatalogue[pi].setUser(pageData["user"]);
  } else if (pi == 5) {
    pageCatalogue[pi].setMatch(pageData["match"]);
  }
}

class _AppPageState extends State<AppPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("was " + pageStack.toString());
        if (pageDepth.value != 0) {
          pageStack[appCurrentIndex].removeLast();
          pageDepth.value--;
        } else {
          if (changedTabs) {
            setState(() {
              appCurrentIndex = appPrevIndex;
              changedTabs = false;
              pageDepth.value = pageStack[appCurrentIndex].length - 1;
            });
          } else {
            return true;
          }
        }
        print("is now " + pageStack.toString());
        setupNewPage();
        return false;
      },
      child: ValueListenableBuilder(
        valueListenable: themeStyle,
        builder: (context, value, child) => Scaffold(
              body: Container(
                color: contrast,
                child: SafeArea(
                  child: Container(
                    color: primary,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                    child: ValueListenableBuilder(
                        valueListenable: pageDepth,
                        builder: (context, value, child) => pageCatalogue[
                            pageStack[appCurrentIndex][pageDepth.value]
                                ['pageIndex']]),
                  ),
                ),
              ),
//        body: pageCatalogue[pageStack[appCurrentIndex][pageDepth.value]
//            ['pageIndex']],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (int newtab) {
                  setState(() {
                    changedTabs = true;
                    appPrevIndex = appCurrentIndex;
                    appCurrentIndex = newtab;
                    pageDepth.value = pageStack[newtab].length - 1;
                    setupNewPage();
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
      ),
    );
  }
}
