import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'UserButton.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'ProfilePage.dart';

class MessagesPage extends StatelessWidget {
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

                      },
                      icon: Icon(
                        Icons.add_comment,
                        color: highlight,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10.0, 20, 10.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Your Messages",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Montserrat',
                        color: secondary),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0.0, 20, 15.0),
                child: Container(
                  height: 2.0,
                  color: highlight,
                ),
              ),
            ],
          ),
    );
  }
}
