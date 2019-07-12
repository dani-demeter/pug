import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color ghostwhite = Color(0xffF9FDFF);
Color lightblue = Color(0xff6ed5fe);

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
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String emailHint = "Username";
  String passHint = "Password";
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      onTap: (){
        setState(() {
          emailHint = "";
          passHint = "Password";
        });
      },
      onChanged: (String val){
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
      onTap: (){
        setState(() {
          emailHint = "Username";
          passHint = "";
        });
      },
      onChanged: (String val){
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
//    final loginButon = Material(
//      elevation: 5.0,
//      borderRadius: BorderRadius.circular(15.0),
//      color: Color(0xff6ed5fe),
//      child: MaterialButton(
//        minWidth: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//        onPressed: () {},
//        child: Text("Login",
//            textAlign: TextAlign.center,
//            style: style.copyWith(
//                color: Colors.white, fontWeight: FontWeight.bold)),
//      ),
//    );
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

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(input1Value + " " + input2Value),
          ));
        },
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        ));
  }
}
