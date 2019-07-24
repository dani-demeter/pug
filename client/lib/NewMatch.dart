import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';

DateTime newMatchDate =
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
TimeOfDay newMatchTime = TimeOfDay.now();

class NewMatch extends StatefulWidget {
  _NewMatchState createState() => _NewMatchState();
}

class _NewMatchState extends State<NewMatch> {
  @override
  Widget build(BuildContext context) {
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
          newMatchDate = picked;
        });
      }
    }

    Future<Null> _selectTime(BuildContext context) async {
      final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        print(picked);
        setState(() {
          newMatchTime = picked;
        });
      }
    }

    return WillPopScope(
      onWillPop: () async {
        fullPageState.goBackFromCreateMatch();
        return false;
      },
      child: ValueListenableBuilder(
        valueListenable: themeStyle,
        builder: (context, value, child) => Scaffold(
              backgroundColor: primary,
              body: Container(
                color: contrast,
                child: SafeArea(
                  child: Container(
                    color: primary,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: contrast,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Material(
                                  color: common,
                                  borderRadius: BorderRadius.circular(15),
                                  child: InkWell(
                                    onTap: () {
                                      fullPageState.goBackFromCreateMatch();
                                    },
                                    splashColor: contrast,
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.close,
                                              color: primary,
                                            ),
                                          ),
                                          Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: primary,
                                                fontSize: 20,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Column(
                            children: [
                              Text(
                                "Create New Match",
                                style: TextStyle(
                                    color: secondary,
                                    fontSize: 30,
                                    fontFamily: 'Montserrat'),
                              ),
                              Container(color: highlight, height: 2),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date:",
                                      style: TextStyle(
                                          color: secondary,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20),
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
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                newMatchDate.day.toString() +
                                                    "/" +
                                                    newMatchDate.month
                                                        .toString(),
                                                style: TextStyle(
                                                    color: primary,
                                                    fontSize: 20,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
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
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Time:",
                                      style: TextStyle(
                                          color: secondary,
                                          fontFamily: 'Montserrat',
                                          fontSize: 20),
                                    ),
                                    Material(
                                      color: common,
                                      borderRadius: BorderRadius.circular(15),
                                      child: InkWell(
                                        onTap: () {
                                          _selectTime(context);
                                        },
                                        splashColor: contrast,
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                newMatchTime.hour.toString() +
                                                    ":" +
                                                    newMatchTime.minute
                                                        .toString(),
                                                style: TextStyle(
                                                    color: primary,
                                                    fontSize: 20,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Icon(
                                                  Icons.access_time,
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
                            ],
                          ),
                        ),
                      ],
                    ),
//                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
