import 'package:flutter/material.dart';

import 'main.dart';
import 'GamesPage.dart';

class HomePage extends StatefulWidget {
  _HomePageState myState;

  _HomePageState getState() {
    return myState;
  }

  @override
  _HomePageState createState() {
    myState = _HomePageState();
    return myState;
  }
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<String> sportsList = [
    "Soccer",
    "Basketball",
    "Tennis",
    "Cricket",
    "Baseball",
    "Ultimate Frisbee",
    "American Football",
    "Rugby",
    "Golf"
  ];
  var sportsListTitle;
  var sportsListObjects;
  var sportsPage;

  var gamesPage;
  var homePageOptions;

  _HomePageState() {
    sportsListObjects = sportsList
        .map(
          (word) => Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                child: OutlineButton(
                  onPressed: () {
//                          Navigator.of(context).push(new MaterialPageRoute(
//                              builder: (ctxt) => GamesPage(word)));
                    setState(() {
                      pageDepth = 1;
                      gamesPage.setSport(word);
                    });
                    print(word);
                  },
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  borderSide: BorderSide(color: lightblue, width: 2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          word,
                          style: TextStyle(
                              fontSize: 17.0,
                              color: darkblue,
                              fontFamily: 'Montserrat'),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: ghostwhite,
                ),
              ),
        )
        .toList();
    sportsListTitle = [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
          child: Text(
            "SPORTS",
            style: TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
          )),
      Container(
        height: 2.0,
        color: gold,
      )
    ];

    sportsPage = Padding(
      padding: const EdgeInsets.fromLTRB(36.0, 10.0, 36.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: new List.from(sportsListTitle)
          ..addAll([
            Expanded(
              child: ListView(
                children: sportsListObjects,
              ),
            ),
          ]),
      ),
    );
    gamesPage = GamesPage();

    homePageOptions = [sportsPage, gamesPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: ghostwhite,
//          decoration: const BoxDecoration(
//            gradient: LinearGradient(
//              colors: <Color>[
//                Color(0xFF0D47A1),
//                Color(0xFF1976D2),
//                Color(0xFF42A5F5),
//              ],
//            ),
//          ),
          child: homePageOptions[pageDepth],
        ),
      ),
    );
  }
}
