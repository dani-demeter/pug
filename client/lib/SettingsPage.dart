import 'package:flutter/material.dart';

import 'main.dart';
import 'AppPage.dart';

int searchRadius = 5;

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: secondary,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Container(
                        color: highlight,
                        height: 2,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Dark Mode",
                          style: TextStyle(
                              color: secondary,
                              fontFamily: 'Montserrat',
                              fontSize: 20.0),
                        ),
                        Switch(
                          activeColor: secondary,
                          activeTrackColor: common,
                          inactiveThumbColor: contrast,
                          inactiveTrackColor: common,
                          onChanged: (newVal) {
                            value = newVal;
                            if (newVal) {
                              enableDarkMode();
                            } else {
                              enableLightMode();
                            }
                          },
                          value: themeStyle.value == 1,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search Radius",
                          style: TextStyle(
                              color: secondary,
                              fontFamily: 'Montserrat',
                              fontSize: 20.0),
                        ),
//                        Text(
//                          "${searchRadius} km",
//                          style: TextStyle(
//                              color: secondary,
//                              fontFamily: 'Montserrat',
//                              fontSize: 15),
//                        ),
                        Slider(
                          onChanged: (double val) {
                            setState(() {
                              searchRadius = val.toInt();
                            });
                          },
                          value: searchRadius.toDouble(),
                          min: 1,
                          max: 10,
                          divisions: 9,
                          activeColor: common,
                          label: "${searchRadius} km",
                        ),
                      ],
                    ),
                    RaisedButton(
                      onPressed: (){},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: highlight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                              color: contrast,
                              fontFamily: 'Montserrat',
                              fontSize: 30),
                        ),
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
