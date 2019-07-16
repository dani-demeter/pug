import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';

var searchPageOptions;
var searchPage1;
var searchPage2;

class SearchPage extends StatefulWidget {
  _SearchPageState myState;

  getState(){
    return myState;
  }

  updateState(){
    myState.setState((){});
  }


  @override
  _SearchPageState createState() {
    myState = _SearchPageState();
    return myState;
  }
}

List<String> foundUsers = [];

getUsers(String query) {
  foundUsers = [
    "dooni1313",
    "dooniisauser",
    "dooniwastaken",
    "anotherdooni",
    "dooni420",
    "dooni1313",
    "dooniisauser",
    "dooniwastaken",
    "anotherdooni",
    "dooni420"
  ];
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    searchPage1 = Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "SEARCH FOR A USER",
              style: TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0.0, 0, 15.0),
          child: Container(
            height: 2.0,
            color: highlight,
          ),
        ),
        TextField(
          onChanged: (search) {
            getUsers(search);
            setState(() {});
          },
          style: TextStyle(
              color: common, fontFamily: 'Montserrat', fontSize: 20.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        ),
        Expanded(
          child: ListView(
              children: foundUsers
                  .map<Widget>(
                    (user) => Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          child: Material(
                            color: primary,
                            child: InkWell(
                              splashColor: highlight,
                              child: OutlineButton(
                                onPressed: () {
                                  print(user);
                                  setState(() {
                                    pageDepth = 1;
                                  });
                                },
//                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                                borderSide:
                                    BorderSide(color: common, width: 2.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        user,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: contrast,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      Icon(Icons.arrow_forward_ios)
                                    ]),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                  )
                  .toList()),
        ),
      ],
    );
    searchPage2 = Container(
      color: Colors.orange,
    );
    searchPageOptions = [searchPage1, searchPage2];
    print("rebuilt search page" + pageDepth.toString());
    return Scaffold(
      body: Container(
        color: contrast,
        child: SafeArea(
          child: Container(
            color: primary,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: searchPageOptions[pageDepth],
            ),
          ),
        ),
      ),
    );
  }
}
