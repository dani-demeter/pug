import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color ghostwhite = Color(0xffF9FDFF);
Color darkblue = Color(0xff241d4e);
Color lightblue = Color(0xff6ed5fe);
Color gold = Color(0xfffece2b);

String input1Value = '';
String input2Value = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: lightblue,
      ),
      home: LoginPage(title: 'Login'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String emailHint = "Username";
  String passHint = "Password";

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onTap: () {
        setState(() {
          emailHint = "";
          passHint = "Password";
        });
      },
      onChanged: (String val) {
        input1Value = val;
      },
      obscureText: false,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: emailHint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      onTap: () {
        setState(() {
          emailHint = "Username";
          passHint = "";
        });
      },
      onChanged: (String val) {
        input2Value = val;
      },
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: passHint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
    final loginButton = Material(
      child: LoginButton(),
      elevation: 5.0,
      color: lightblue,
      borderRadius: BorderRadius.circular(15.0),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: ghostwhite,
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
                loginButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
        splashColor: const Color(0xff090821),
        // When the user taps the button, show a snackbar.
        onTap: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (ctxt) => new AppPage()));
//          Scaffold.of(context).showSnackBar(SnackBar(
//            content: Text(input1Value + " " + input2Value),
//          ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        ));
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  int _currentIndex = 0;
  final _pageOptions = [
    HomePage(),
    Container(color: Colors.red),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int newtab) {
          setState(() {
            _currentIndex = newtab;
          });
        },
        backgroundColor: darkblue,
        selectedItemColor: lightblue,
        unselectedItemColor: ghostwhite,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  List<String> sportsList = [
    "Soccer",
    "Basketball",
    "Tennis",
    "Cricket",
    "Baseball",
    "Ultimate Frisbee",
    "American Football",
    "Rugby",
    "Golf"
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final sportsListTitle = [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
          child: Text(
            "SPORTS",
            style: TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
          )),
      Container(
        height: 2.0,
        color: gold,
      )
    ];
    final sportsListObjects = widget.sportsList
        .map(
          (word) => Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                child: OutlineButton(
                  onPressed: () {
                    print(word);
                  },
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  borderSide: BorderSide(color: lightblue, width: 2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          word,
                          style: TextStyle(
                              fontSize: 17.0,
                              color: darkblue,
                              fontFamily: 'Montserrat'),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: ghostwhite,
                ),
              ),
        )
        .toList();
    return Scaffold(
      body: Center(
        child: Container(
          color: ghostwhite,
//          decoration: const BoxDecoration(
//            gradient: LinearGradient(
//              colors: <Color>[
//                Color(0xFF0D47A1),
//                Color(0xFF1976D2),
//                Color(0xFF42A5F5),
//              ],
//            ),
//          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 10.0, 36.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: new List.from(sportsListTitle)
                ..addAll([
                  Expanded(
                    child: ListView(
                      children: sportsListObjects,
                    ),
                  ),
                ]),
//              children: new List.from(sportsListTitle)
//                ..addAll(sportsListObjects),
            ),
          ),
        ),
      ),
//          ListView(
//            children: widget.sportsList.map((word) => Text(word)).toList(),
//          )
    );
  }
}
