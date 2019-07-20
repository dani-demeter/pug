import 'package:flutter/material.dart';

import 'AppPage.dart';
import 'main.dart';

class UserButton extends StatelessWidget{
  var user;
  UserButton(this.user);


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Padding(
      padding: const EdgeInsets.fromLTRB(
          10.0, 5.0, 10.0, 0.0),
      child: Material(
        color: primary,
        child: InkWell(
          splashColor: highlight,
          child: OutlineButton(
            onPressed: () {
              print(user);
              pageStack[appCurrentIndex].add({"pageIndex": 4, "user": user});
              pageCatalogue[4].setUser(user);
              pageDepth.value++;
            },
            borderSide:
            BorderSide(color: common, width: 2.0),
            child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user['username'],
                    style: TextStyle(
                        fontSize: 17.0,
                        color: secondary,
                        fontFamily: 'Montserrat'),
                  ),
                  Icon(Icons.arrow_forward_ios, color: secondary,)
                ]),
            shape: new RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(10.0)),
          ),
        ),
      ),
    ),);
  }

}