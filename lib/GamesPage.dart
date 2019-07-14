import 'package:flutter/material.dart';

import 'main.dart';
import 'HomePage.dart';

String title="noone";

class GamesPage extends StatefulWidget{

  setSport(String sport){
    title = sport;
  }

  @override
  _GamesPageState createState() => _GamesPageState();

}

class _GamesPageState extends State<GamesPage>{

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}