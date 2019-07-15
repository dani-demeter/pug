import 'package:flutter/material.dart';

import 'LogIn.dart';
import 'AppPage.dart';

void main() => runApp(MyApp());

Color ghostwhite = Color(0xffF9FDFF);
Color darkblue = Color(0xff241d4e);
Color lightblue = Color(0xff6ed5fe);
Color gold = Color(0xfffece2b);

Color primary = ghostwhite;
Color contrast = darkblue;
Color common = lightblue;
Color highlight = gold;

String input1Value = '';
String input2Value = '';

int pageDepth = 0;

var fullPage = FullPage();
_FullPageState fullPageState;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        primaryColor: common,
      ),
      home: fullPage,
    );
  }
}

class FullPage extends StatefulWidget {
  @override
  _FullPageState createState() => _FullPageState();
}

var loginPage = LoginPage();
var appPage = AppPage();

class _FullPageState extends State<FullPage> {
  int _pageIndex = 0;
  var _pageOptions = [loginPage, appPage];

  _FullPageState() {
    fullPageState = this;
  }

  logIn() {
    setState(() {
      _pageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _pageOptions[_pageIndex];
  }
}
