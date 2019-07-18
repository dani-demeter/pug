import 'package:flutter/material.dart';

import 'main.dart';
import 'GamesPage.dart';
import 'AppPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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

  _HomePageState() {
    sportsListObjects = sportsList
        .map(
          (word) => Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Material(
                  color: primary,
                  child: InkWell(
                    splashColor: highlight,
                    child: OutlineButton(
                      onPressed: () {
                        pageStack[0].add({"pageIndex": 3, "sport": word});
                        pageCatalogue[3].setSport(word);
                        gamesPage.setSport(word);
                        pageDepth.value = 1;
                        print(word);
                      },
                      borderSide: BorderSide(color: common, width: 2.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              word,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: contrast,
                                  fontFamily: 'Montserrat'),
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ]),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              ),
        )
        .toList();
    sportsListTitle = [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: Text(
            "SPORTS",
            style: TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
          )),
      Container(
        height: 2.0,
        color: highlight,
      )
    ];

    sportsPage = Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: contrast,
        child: SafeArea(
          child: Center(
            child: Container(
              color: primary,
//          decoration: const BoxDecoration(
//            gradient: LinearGradient(
//              colors: <Color>[
//                Color(0xFF0D47A1),
//                Color(0xFF1976D2),
//                Color(0xFF42A5F5),
//              ],
//            ),
//          ),
            child: sportsPage,
//              child: ValueListenableBuilder<int>(
//                valueListenable: pageDepth,
////                builder: (context, value, child)=>homePageOptions[pageDepth.value],
//                builder: (context, value, child)=>,
//
////                child: homePageOptions[pageDepth.value],
//              ),
            ),
          ),
        ),
      ),
    );
  }
}
