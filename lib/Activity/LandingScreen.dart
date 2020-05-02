import 'package:aatmanapp/Helper/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'LoginScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontFamily: "OpenSans",
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: ListTile(
            title: Text(
              "LogOut",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 16.0
              ),
            ),
            onTap:() {
              LogOut();
            },
          ),
        ),
      ),
    );
  }

  LogOut() async{
    Navigator.pushAndRemoveUntil(context, ScaleRoute(page:LoginScreen()), ModalRoute.withName('/LoginScreen'));
    await storage.write(key: "LogIn", value: "0");
  }

}
