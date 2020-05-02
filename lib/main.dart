import 'package:flutter/material.dart';

import 'Activity/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Aatman App",
      theme:ThemeData(
        accentColor: Colors.grey[600],
        primaryColor: Colors.deepOrange[400],
        primaryColorDark: Colors.deepOrange[800],
      ),
      home: SplashScreen(),
    );
  }
}

