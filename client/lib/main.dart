import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LogIn.dart';
import 'AppPage.dart';
import 'NewMatch.dart';

void main() {
  getPrefs();
  runApp(MyApp());
}

getPrefs() {
  setTheme();
  setSearchRadius();
}

Color ghostwhite = Color(0xffF9FDFF);
Color darkblue = Color(0xff241d4e);
Color lightblue = Color(0xff6ed5fe);
Color gold = Color(0xfffece2b);
Color lightercadet = Color(0xff4F549B);
Color newblue = Color(0xff35E7FF);
Color primary = ghostwhite;
Color secondary = darkblue;
Color contrast = darkblue;
Color common = newblue;
Color highlight = gold;

String input1Value = '';
String input2Value = '';

String myUsername = "dooni";

int searchRadius = 5;

//int pageDepth = 0;
var pageDepth = ValueNotifier(0);

var fullPage = FullPage();
_FullPageState fullPageState;

var themeStyle = ValueNotifier(0);

setTheme() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int val = prefs.getInt('theme');
  if (val == 1) {
    enableDarkMode();
  }
}

enableDarkMode() {
  primary = darkblue;
  secondary = ghostwhite;
  contrast = lightercadet;
  highlight = gold;
  common = newblue;
  themeStyle.value = 1;
  setThemePref(1);
}

setThemePref(int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('theme', val);
}

enableLightMode() {
  primary = ghostwhite;
  secondary = darkblue;
  contrast = darkblue;
  common = newblue;
  highlight = gold;
  themeStyle.value = 0;
  setThemePref(0);
}

setSearchRadiusPref(int val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('searchRadius', val);
}

setSearchRadius() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  searchRadius = prefs.getInt('searchRadius') ?? 5;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStyle,
      builder: (context, value, child) => MaterialApp(
            title: 'Homepage',
            theme: ThemeData(
              primaryColor: lightercadet,
              accentColor: themeStyle.value == 0 ? lightercadet : highlight, //clock hand, clock ok/cancel, calendar bubble, calendar ok/cancel
              dialogBackgroundColor: primary, //both backgrounds
              disabledColor: themeStyle.value == 0 ? Colors.grey[20] : lightercadet, //past dates
              primaryColorBrightness: Brightness.dark,
              //can change big text between white & black
              brightness: themeStyle.value == 0 ? Brightness.light : Brightness.dark,
              backgroundColor: lightercadet, //banner
              textTheme: TextTheme(
                body1: TextStyle(color: secondary), //good calendar days
                caption: TextStyle(color: secondary), //calendar day headers
                subhead: TextStyle(color: secondary), //clock numbers
              ),
              fontFamily: 'Montserrat',
            ),
            home: fullPage,
          ),
    );
  }
}

class FullPage extends StatefulWidget {
  @override
  _FullPageState createState() => _FullPageState();
}

LoginPage loginPage = LoginPage();
AppPage appPage = AppPage();
NewMatch newMatch = NewMatch();

class _FullPageState extends State<FullPage> {
  int _pageIndex = 0;
  var _pageOptions = [loginPage, appPage, newMatch];

  _FullPageState() {
    fullPageState = this;
  }

  logIn() {
    setState(() {
      _pageIndex = 1;
    });
  }

  goToCreateMatch() {
    setState(() {
      _pageIndex = 2;
    });
  }

  goBackFromCreateMatch() {
    setState(() {
      _pageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _pageOptions[_pageIndex];
  }
}
