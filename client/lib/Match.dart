import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'MatchPage.dart';
import 'AppPage.dart';

class Match extends StatelessWidget {
  var match;
  bool tappable = true;

  Match(this.match, this.tappable);

  @override
  Widget build(BuildContext context) {
    var matchElt = ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) {
        TextStyle infoStyle =
            TextStyle(color: secondary, fontFamily: 'Montserrat');
        return Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: common),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                              child: Row(children: [
                                Icon(
                                  Icons.access_time,
                                  color: common,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(match['time'].toString(),
                                        style: infoStyle)),
                              ]),
                            )),
                            Expanded(
                                child: Container(
                              child: Row(children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: common,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(match['cost']==0?"Free":'\$'+match['cost'].toString(),
                                        style: infoStyle)),
                              ]),
                            )),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                              child: Row(children: [
                                Icon(
                                  Icons.people,
                                  color: common,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(match['players'].toString(),
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
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(match['range'].toString(),
                                        style: infoStyle)),
                              ]),
                            )),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(match['location'].toString(),
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
        );
      },
    );
    if (tappable) {
      return ValueListenableBuilder(
        valueListenable: themeStyle,
        builder: (context, value, child) => Padding(
              padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
              child: Material(
                color: primary,
                child: InkWell(
                  splashColor: highlight,
                  onTap: () {
                    pageStack[appCurrentIndex]
                        .add({"pageIndex": 5, "match": match});
                    pageCatalogue[5].setMatch(match);
                    pageDepth.value++;
                  },
                  child: matchElt,
                ),
              ),
            ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
        child: matchElt,
      );
    }
  }
}
