import 'package:flutter/material.dart';
import 'dart:convert';

import 'main.dart';
import 'UserButton.dart';
import 'HomePage.dart';
import 'AppPage.dart';
import 'ProfilePage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

//List<String> foundUsernames = [];
var foundUsernames = ValueNotifier(<String>[]);
String foundUsersString =
    """[{"username": "dooni1313", "reliability": 5.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooniisa", "reliability": 4.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooniwastaken", "reliability": 4.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooni1313", "reliability": 3.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "anotherdooni", "reliability": 3.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooni420", "reliability": 2.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "og_dooni", "reliability": 2.0,"replayability": 4.5, "attending": [12345, 45678]},{"username": "dooni2.0", "reliability": 1.5,"replayability": 4.5, "attending": [12345, 45678]},{"username": "notDooni", "reliability": 1.0,"replayability": 4.5, "attending": [12345, 45678]}]""";
var foundUsers = []; //must be array

getUsers(String query) {
  //do http request
  foundUsers = json.decode(foundUsersString);
  List<String> fusers =
      foundUsers.map<String>((u) => u['username'].toString()).toList();
  foundUsernames.value = fusers;
}

var searchQuery = "";

class _SearchPageState extends State<SearchPage> {
  var textFieldController = TextEditingController();
  var searchPageElt;

  _SearchPageState() {
    searchPageElt = ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "SEARCH FOR A USER",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Montserrat',
                          color: secondary),
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
                  cursorColor: highlight,
                  controller: textFieldController,
                  onChanged: (search) {
                    searchQuery = search;
                    getUsers(search);
                  },
                  style: TextStyle(
                      color: common, fontFamily: 'Montserrat', fontSize: 20.0),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: secondary),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Username",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: foundUsernames,
                      builder: (context, value, child) {
                        if (foundUsernames.value.length == 0) {
                          return Image.asset("searching.png");
                        } else {
                          return ListView(
                              children: foundUsers
                                  .map<Widget>((user) => UserButton(user))
                                  .toList());
                        }
                      }),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    textFieldController.text = searchQuery;
//    print("rebuilt search page" + pageDepth.toString());
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Container(
            color: primary,
            child: searchPageElt,
          ),
    );
  }
}
