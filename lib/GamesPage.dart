import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';
import 'AppPage.dart';

String sport = "none";

class GamesPage extends StatefulWidget {
//  GamesPage(sport);

  setSport(String selectedSport) {
    sport = selectedSport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(sport),
      ),
    );
  }
}
