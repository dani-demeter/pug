import 'package:flutter/material.dart';

import 'main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => Scaffold(
            body: Center(
              child: Container(
                color: primary,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(36.0, 10.0, 36.0, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140.0,
                        child: Image.asset(
                          "assets/pug.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        onChanged: (String val) {
                          input1Value = val;
                        },
                        obscureText: false,
                        style: TextStyle(
                            color: secondary,
                            fontFamily: 'Montserrat',
                            fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: secondary),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Username",
                          hintStyle: TextStyle(
                              color: common,
                              fontFamily: 'Montserrat',
                              fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: highlight),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        obscureText: true,
                        onChanged: (String val) {
                          input2Value = val;
                        },
                        style: TextStyle(
                            color: secondary,
                            fontFamily: 'Montserrat',
                            fontSize: 20),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: secondary),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: common,
                              fontFamily: 'Montserrat',
                              fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: highlight),
                          ),
                        ),
                      ),
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
                                color: secondary,
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
