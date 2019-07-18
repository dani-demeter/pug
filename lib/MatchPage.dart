import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

import 'main.dart';
import 'AppPage.dart';
import 'Match.dart';
import 'UserButton.dart';

openMap(String loc) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$loc';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

getAttending(int id) {
  //TODO http request for attending, by id
  String playersString =
      """[{"username": "dooni1313", "reliability": 5.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooniisa", "reliability": 4.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooniwastaken", "reliability": 4.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooni1313", "reliability": 3.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "anotherdooni", "reliability": 3.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooni420", "reliability": 2.5,"replayability": 4.5, "attending": [12345, 45678]}]""";
  return json.decode(playersString);
}

class MatchPage extends StatelessWidget {
  String matchLocation = "";
  String matchTime = "";
  String matchDate = "";
  String matchRange = "";
  int matchID = 0;
  int matchPlayers = 0;
  List<dynamic> players = [];
  var fullmatch;

  setMatch(var match) {
    matchLocation = match['location'];
    matchTime = match['time'];
    matchDate = match['date'];
    matchRange = match['range'];
    matchID = match['id'];
    matchPlayers = match['players'];
    fullmatch = match;
    players = getAttending(matchID);
    print(match);
  }

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
                      "Back",
                      style: TextStyle(
                          color: common,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: [
                Match(fullmatch, false),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ATTENDING",
                        style: TextStyle(
                            color: contrast,
                            fontSize: 20,
                            fontFamily: 'Montserrat'),
                      ),
                      Container(
                        height: 2.0,
                        color: highlight,
                      ),
                    ],
                  ),
                ),
              ]
                ..addAll(
                  players.map((player) => UserButton(player)),
                )
                ..addAll([
                  RaisedButton(
                    child: Text("Count me in!"),
                    onPressed: () {
                      openMap(matchLocation);
                    },
                  ),
                ]),
            ),
          ),
        ),
      ],
    );
  }
}
