import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'ProfilePage.dart';

var searchPageOptions;
var searchPage1;
var searchPage2 = ProfilePage();

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

//List<String> foundUsers = [];
var foundUsers = ValueNotifier(<String>[]);

getUsers(String query) {
  foundUsers.value = [
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

var searchQuery = "";

class _SearchPageState extends State<SearchPage> {
  var textFieldController = TextEditingController();
  _SearchPageState(){
    searchPage1 = Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Column(
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
            controller: textFieldController,
            onChanged: (search) {
              searchQuery = search;
              getUsers(search);
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
            child: ValueListenableBuilder(
                valueListenable: foundUsers,
                builder: (context, value, child) => ListView(
                    children: foundUsers.value
                        .map<Widget>(
                          (user) => Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Material(
                          color: primary,
                          child: InkWell(
                            splashColor: highlight,
                            child: OutlineButton(
                              onPressed: () {
                                print(user);
                                searchPage2.setUser(user);
                                setState(() {
                                  pageDepth.value = 1;
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
                        .toList())),
          ),
        ],
      ),
    );
    searchPageOptions = [searchPage1, searchPage2];
  }

  @override
  Widget build(BuildContext context) {
    textFieldController.text = searchQuery;
//    print("rebuilt search page" + pageDepth.toString());
    return Scaffold(
      body: Container(
        color: contrast,
        child: SafeArea(
          child: Container(
            color: primary,
            child: ValueListenableBuilder<int>(
              valueListenable: pageDepth,
              builder: (context, value, child) =>
                  searchPageOptions[pageDepth.value],
//                child: searchPageOptions[pageDepth.value],
            ),
          ),
        ),
      ),
    );
  }
}
