import 'package:flutter/material.dart';

import 'FABBottomAppBar.dart';
import 'main.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'GamesPage.dart';
import 'ProfilePage.dart';
import 'MatchPage.dart';
import 'UserPage.dart';
import 'MessagesPage.dart';

int appCurrentIndex = 0;

bool changedTabs = false;
int appPrevIndex = 0;
HomePage homePage = HomePage();
SearchPage searchPage = SearchPage();
GamesPage gamesPage = GamesPage();
ProfilePage profilePage = ProfilePage();
MatchPage matchPage = MatchPage();
UserPage userPage = UserPage();
MessagesPage messagesPage = MessagesPage();
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
  messagesPage,
];
// 0 = homePage
// 1 = searchPage
// 2 = userPage
// 3 = gamesPage
// 4 = profilePage
// 5 = matchPage
// 6 = messagesPage

List<List<dynamic>> pageStack = [
  [
    {"pageIndex": 0}
  ],
  [
    {"pageIndex": 1}
  ],
  [
    {"pageIndex": 6}
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
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
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
              resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: false,
              backgroundColor: primary,
              body: Container(
                color: contrast,
                child: SafeArea(
                  child: Container(
                    color: primary,
//                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                    child: ValueListenableBuilder(
                        valueListenable: pageDepth,
                        builder: (context, value, child) => pageCatalogue[
                            pageStack[appCurrentIndex][pageDepth.value]
                                ['pageIndex']]),
                  ),
                ),
              ),
//              resizeToAvoidBottomPadding: false,
              bottomNavigationBar: FABBottomAppBar(
                onTabSelected: (int newtab) {
                  setState(() {
                    changedTabs = true;
                    appPrevIndex = appCurrentIndex;
                    appCurrentIndex = newtab;
                    pageDepth.value = pageStack[newtab].length - 1;
                    setupNewPage();
                  });
                },
                centerItemText: "Create",
                notchedShape: CircularNotchedRectangle(),
                backgroundColor: contrast,
                color: common,
                selectedColor: highlight,
                items: [
                  FABBottomAppBarItem(
                    iconData: Icons.home,
                    text: "Home",
                  ),
                  FABBottomAppBarItem(
                    iconData: Icons.search,
                    text: "Search",
                  ),
                  FABBottomAppBarItem(
                    iconData: Icons.message,
                    text: "Messages",
                  ),
                  FABBottomAppBarItem(
                    iconData: Icons.person,
                    text: "Profile",
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: primary,
                  size: 30,
                ),
                backgroundColor: common,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
      ),
    );
  }
}
