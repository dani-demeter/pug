import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'Match.dart';

String sport = "none";
var matchesStrings =
    """[{"location": "13 Happy Face Ave", "time": "18:45", "date": "9/14", "players": 6, "range": "5-10", "id": 12345}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 13456}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 23456}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 34567}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 45678}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 56789}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "id": 67890}]""";
var matches = json.decode(matchesStrings);

class GamesPage extends StatefulWidget {
  setSport(String selectedSport) {
//    print(matches[0]['location']);
    sport = selectedSport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();
}


var matchElements = matches
    .map<Widget>(
      (match) => Match(match, true)
    )
    .toList();

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //for top bar color
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.topCenter,
          color: contrast,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  pageStack[appCurrentIndex].removeLast();
                  pageDepth.value--;
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: common,
                    ),
                    Text(
                      "All Sports",
                      style: TextStyle(
                          color: common,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  color: common,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    sport.toUpperCase() + " MATCHES",
                    style: TextStyle(
                        color: contrast,
                        fontSize: 30.0,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                Container(
                  height: 2.0,
                  color: highlight,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: matchElements,
          ),
        ),
      ],
    );
  }
}
