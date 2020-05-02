import 'package:aatmanapp/Activity/LandingScreenAdmin.dart';
import 'package:aatmanapp/Helper/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'LandingScreen.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();
  String Login,role;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepOrange[800],
            Colors.deepOrange[600],
            Colors.deepOrange[500],
            Colors.deepOrange[300],
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/aatman_logo.png",
                height: 80.0, width: 230.0),
            SizedBox(
              height: 80.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  checkData() async {
    Login = await storage.read(key: "LogIn");
    role= await storage.read(key: "Role");
    print(Login);
    if (Login == null) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(context, ScaleRoute(page: LoginScreen()),
            ModalRoute.withName('/LoginScreen'));
      });
    } else if(Login == "1") {
      if(role=="Admin"){
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(context, ScaleRoute(page: LandingScreenAdmin()),
              ModalRoute.withName('/LandingScreenAdmin'));
        });
      }else if(role=="User"){
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(context, ScaleRoute(page: LandingScreen()),
              ModalRoute.withName('/LandingScreen'));
        });
      }else{
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(context, ScaleRoute(page: LoginScreen()),
              ModalRoute.withName('/LoginScreen'));
        });
      }
    }else{
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(context, ScaleRoute(page: LoginScreen()),
            ModalRoute.withName('/LoginScreen'));
      });
    }
  }
}
