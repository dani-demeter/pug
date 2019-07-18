import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'SearchPage.dart';
import 'CustomIcons.dart';

ValueNotifier<String> profileUsername = ValueNotifier<String>("");

class ProfilePage extends StatelessWidget {
  double _reliability = 0;
  double _replayability = 0;
  List<int> attendingIDs = [];

  setUser(user) {
    profileUsername.value = user['username'];
    _reliability = user['reliability'];
    _replayability = user['replayability'];
    attendingIDs = user['attending'].cast<int>();
    print(profileUsername.value +
        " " +
        _reliability.toString() +
        " " +
        _replayability.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: profileUsername,
      builder: (context, value, child) => Column(
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add,
                        color: highlight,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ), //top nav bar
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        child: Icon(
                                          Icons.person,
                                          color: common,
                                        ),
                                      ),
                                      Text(
                                        profileUsername.value,
                                        style: TextStyle(
                                          color: contrast,
                                          fontSize: 28 -
                                              profileUsername.value.length
                                                  .toDouble(),
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        child: Icon(
                                          Icons.stars,
                                          color: common,
                                        ),
                                      ),
                                    ]
                                      ..addAll(List(_reliability.floor())
                                          .map<Widget>((e) => Icon(
                                                Icons.star,
                                                color: contrast,
                                                size: 20,
                                              ))
                                          .toList())
                                      ..addAll(List(_reliability.floor() <
                                                  _reliability
                                              ? 1
                                              : 0)
                                          .map<Widget>((e) => Icon(
                                                Icons.star_half,
                                                color: contrast,
                                                size: 20,
                                              ))
                                          .toList())
                                      ..addAll(List(5 - _reliability.ceil())
                                          .map<Widget>((e) => Icon(
                                                Icons.star_border,
                                                color: contrast,
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 5, 0),
                                        child: Icon(
                                          DaniFont.heart_full,
                                          color: common,
                                        ),
                                      ),
                                    ]
                                      ..addAll(List(_replayability.floor())
                                          .map<Widget>((e) => Icon(
                                                DaniFont.heart_full,
                                                color: contrast,
                                                size: 20,
                                              ))
                                          .toList())
                                      ..addAll(List(_replayability.floor() <
                                                  _replayability
                                              ? 1
                                              : 0)
                                          .map<Widget>((e) => Icon(
                                                DaniFont.heart_half,
                                                color: contrast,
                                                size: 20,
                                              ))
                                          .toList())
                                      ..addAll(List(5 - _replayability.ceil())
                                          .map<Widget>((e) => Icon(
                                                DaniFont.heart_empty,
                                                color: contrast,
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
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                      child: Text(
                        "Going To",
                        style: TextStyle(
                            color: contrast,
                            fontSize: 30.0,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
                      child: Container(
                        height: 2.0,
                        color: highlight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
