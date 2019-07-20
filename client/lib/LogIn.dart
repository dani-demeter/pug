import 'package:flutter/material.dart';

import 'main.dart';

class LoginPage extends StatelessWidget {
  static TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextField emailField = TextField(
    onChanged: (String val) {
      input1Value = val;
    },
    obscureText: false,
    style: style,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
  );
  TextField passwordField = TextField(
    obscureText: true,
    onChanged: (String val) {
      input2Value = val;
    },
    style: style,
//    textAlign: TextAlign.center,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Scaffold(
            body: Center(
              child: Container(
                color: primary,
                child: Padding(
//            padding: const EdgeInsets.all(36.0),
                  padding: const EdgeInsets.fromLTRB(36.0, 10.0, 36.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 140.0,
                        child: Image.asset(
                          "assets/pug.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      emailField,
                      SizedBox(height: 10.0),
                      passwordField,
                      SizedBox(
                        height: 15.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          fullPageState.logIn();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: contrast,
                                fontSize: 20.0,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        color: common,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
