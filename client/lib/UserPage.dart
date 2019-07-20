import 'package:flutter/material.dart';
import 'dart:convert';

import 'CustomIcons.dart';
import 'main.dart';
import 'UserButton.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'ProfilePage.dart';

class UserPage extends StatelessWidget {
  double _reliability = 0;
  double _replayability = 0;
  List<int> attendingIDs = [];

  UserPage() {
    //TODO get my user's stats by username
    _reliability = 4.5;
    _replayability = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Column(
      children: [
        Container(
          //for top bar color
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.topCenter,
          color: contrast,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  if(themeStyle.value==0){
                    enableDarkMode();
                  }else{
                    enableLightMode();
                  }
                },
                icon: Icon(
                  Icons.settings,
                  color: highlight,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Image.asset(
                      'pugprofile.png',
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Icon(
                                    Icons.person,
                                    color: common,
                                  ),
                                ),
                                Text(
                                  myUsername,
                                  style: TextStyle(
                                    color: secondary,
                                    fontSize: 28 - myUsername.length.toDouble(),
                                    fontFamily: 'Montserrat',
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Icon(
                                    Icons.stars,
                                    color: common,
                                  ),
                                ),
                              ]
                                ..addAll(List(_reliability.floor())
                                    .map<Widget>((e) => Icon(
                                          Icons.star,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList())
                                ..addAll(List(
                                        _reliability.floor() < _reliability
                                            ? 1
                                            : 0)
                                    .map<Widget>((e) => Icon(
                                          Icons.star_half,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList())
                                ..addAll(List(5 - _reliability.ceil())
                                    .map<Widget>((e) => Icon(
                                          Icons.star_border,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList()),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Icon(
                                    DaniFont.heart_full,
                                    color: common,
                                  ),
                                ),
                              ]
                                ..addAll(List(_replayability.floor())
                                    .map<Widget>((e) => Icon(
                                          DaniFont.heart_full,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList())
                                ..addAll(List(
                                        _replayability.floor() < _replayability
                                            ? 1
                                            : 0)
                                    .map<Widget>((e) => Icon(
                                          DaniFont.heart_half,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList())
                                ..addAll(List(5 - _replayability.ceil())
                                    .map<Widget>((e) => Icon(
                                          DaniFont.heart_empty,
                                          color: secondary,
                                          size: 20,
                                        ))
                                    .toList()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //actual profile part
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                child: Container(
                  height: 2.0,
                  color: highlight,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
          child: Material(
            color: primary,
            child: InkWell(
              splashColor: highlight,
              child: OutlineButton(
                onPressed: () {
                },
                borderSide: BorderSide(color: common, width: 2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Planning to Attend",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: secondary,
                            fontFamily: 'Montserrat'),
                      ),
                      Icon(Icons.arrow_forward_ios, color: secondary,)
                    ]),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
          child: Material(
            color: primary,
            child: InkWell(
              splashColor: highlight,
              child: OutlineButton(
                onPressed: () {
                },
                borderSide: BorderSide(color: common, width: 2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Friends",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: secondary,
                            fontFamily: 'Montserrat'),
                      ),
                      Icon(Icons.arrow_forward_ios, color: secondary,)
                    ]),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
          child: Material(
            color: primary,
            child: InkWell(
              splashColor: highlight,
              child: OutlineButton(
                onPressed: () {
                },
                borderSide: BorderSide(color: common, width: 2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recently Played With",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: secondary,
                            fontFamily: 'Montserrat'),
                      ),
                      Icon(Icons.arrow_forward_ios, color: secondary,)
                    ]),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
          child: Material(
            color: primary,
            child: InkWell(
              splashColor: highlight,
              child: OutlineButton(
                onPressed: () {
                },
                borderSide: BorderSide(color: common, width: 2.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Past Games",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: secondary,
                            fontFamily: 'Montserrat'),
                      ),
                      Icon(Icons.arrow_forward_ios, color: secondary,)
                    ]),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    ),); //top nav bar
  }
}
