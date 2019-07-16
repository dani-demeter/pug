import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'SearchPage.dart';

class ProfilePage extends StatelessWidget {
  String _username = "";

  setUser(user) {
    _username = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: contrast,
        child: SafeArea(
          child: Container(
            color: primary,
            child: Column(
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
                              "Search",
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
                          color: common,
                        ),
                      ),
                    ],
                  ),
                ), //top nav bar
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Column(
                    children: [
                      Row(
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
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: common,
                                      ),
                                      Text(_username)
                                    ],
                                  ),
                                ),
                                Row(
                                    children: [
                                      Icon(
                                        Icons.stars,
                                        color: common,
                                      )
                                    ]..addAll(List(5)
                                        .map<Widget>((e) => Icon(
                                              Icons.star,
                                              color: highlight,
                                            ))
                                        .toList())),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: common,
                                    )
                                  ]..addAll(
                                      List(5)
                                          .map<Widget>(
                                            (e) => Icon(
                                                  Icons.favorite_border,
                                                  color: highlight,
                                                ),
                                          )
                                          .toList(),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ), //actual profile part
                      Text("Going To"),
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
          ),
        ),
      ),
    );
  }
}
