import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';

String sport = "none";
var matchesStrings =
    """[{"location": "13 Happy Face Ave", "time": "18:45", "date": "9/14", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": "6", "range": "5-10"}]""";
var matches = json.decode(matchesStrings);

class GamesPage extends StatefulWidget {
  setSport(String selectedSport) {
//    print(matches[0]['location']);
    sport = selectedSport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();
}

TextStyle infoStyle = TextStyle(color: contrast, fontFamily: 'Montserrat');

var matchElements = matches
    .map<Widget>(
      (match) => Padding(
            padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
            child: Material(
              color: primary,
              child: InkWell(
                splashColor: highlight,
                onTap: () {
                  print(match);
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: common),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/pug.jpg",
                        fit: BoxFit.contain,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Row(children: [
                                        Icon(
                                          Icons.access_time,
                                          color: common,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                                match['time'].toString(),
                                                style: infoStyle)),
                                      ]),
                                    )),
                                    Expanded(
                                        child: Container(
                                      child: Row(children: [
                                        Icon(
                                          Icons.calendar_today,
                                          color: common,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                                match['date'].toString(),
                                                style: infoStyle)),
                                      ]),
                                    )),
                                  ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Row(children: [
                                        Icon(
                                          Icons.people,
                                          color: common,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                                match['players'].toString(),
                                                style: infoStyle)),
                                      ]),
                                    )),
                                    Expanded(
                                        child: Container(
                                      child: Row(children: [
                                        Icon(
                                          Icons.people,
                                          color: common,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                                match['range'].toString(),
                                                style: infoStyle)),
                                      ]),
                                    )),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.pin_drop,
                                            color: common,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(
                                                match['location'].toString(),
                                                style: infoStyle),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    )
    .toList();

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //for color of unsafe area
        color: contrast,
        child: SafeArea(
          //so status bar doesn't overlap
          child: Container(
            //for inner color
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
            color: primary,
            child: Column(
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
                          pageDepth.value--;
//                          appPage.getState().setState();
//                          homePage.getState().setState();
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
            ),
          ),
        ),
      ),
    );
  }
}
