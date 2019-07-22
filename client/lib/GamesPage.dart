import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'Match.dart';

String sport = "none";
var matchesStrings =
    """[{"location": "13 Happy Face Ave", "time": "18:45", "date": "9/14", "players": 6, "range": "5-10", "cost": 0,"id": 12345}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 3.25, "id": 13456}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 0, "id": 23456}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 5, "id": 34567}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 0, "id": 45678}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 2.75, "id": 56789}, {"location": "500 El Camino Real", "time": "18:45", "date": "11/3", "players": 6, "range": "5-10", "cost": 0, "id": 67890}]""";
var matches = json.decode(matchesStrings);

class GamesPage extends StatefulWidget {
  setSport(String selectedSport) {
    sport = selectedSport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();
}

var matchElements = matches.map<Widget>((match) => Match(match, true)).toList();

class _GamesPageState extends State<GamesPage> {
  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day+1);

  Future<Null> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime tomorrow = DateTime(today.year, today.month, today.day + 1);
    DateTime monthFromTomorrow =
        DateTime(tomorrow.year, tomorrow.month + 1, tomorrow.day);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: tomorrow,
      firstDate: tomorrow,
      lastDate: monthFromTomorrow,
    );
    if (picked != null) {
      print(picked);
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Scaffold(
            backgroundColor: primary,
            body: Column(
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
                      Material(
                        color: common,
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          splashColor: contrast,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(
                              children: [
                                Text(
                                  date.month.toString() +
                                      "/" +
                                      date.day.toString(),
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                color: secondary,
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
    );
  }
}
