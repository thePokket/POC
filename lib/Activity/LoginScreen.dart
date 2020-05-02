import 'package:aatmanapp/Helper/FadeAnimation.dart';
import 'package:aatmanapp/Helper/ScaleRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';

import 'LandingScreen.dart';
import 'LandingScreenAdmin.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static final GlobalKey<FormState> formKey = new GlobalKey();
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();

  FocusNode emailnode = new FocusNode();
  FocusNode pwsnode = new FocusNode();

  String email,password,role;

  final storage = FlutterSecureStorage();

  bool _obscureTextConfirm = true, isTrue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.deepOrange[800],
                Colors.deepOrange[600],
                Colors.deepOrange[500],
                Colors.deepOrange[300],
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Log In.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "OpenSans"),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(255, 140, 0, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            hintText: "Email Id",
                                            hintStyle:
                                            TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value){
                                          if (value.isEmpty) {
                                            return "Please Enter ID";
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context).requestFocus(pwsnode);
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: pwdController,
                                        focusNode: pwsnode,
                                        obscureText: _obscureTextConfirm,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: GestureDetector(
                                              onTap: () {
                                                _toggleConfirm();
                                              },
                                              child: _obscureTextConfirm
                                                  ? Icon(Icons.visibility_off, color: Colors.grey[200])
                                                  : Icon(Icons.visibility, color: Colors.deepOrange)),),

                                        validator: (value){
                                          if (value.isEmpty) {
                                            return "Please Enter Password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          SizedBox(
                            height: 40,
                          ),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.grey, fontFamily: "OpenSans"),
                              ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              print("Tapped");
                              bool validate =
                              formKey.currentState.validate();
                              if (validate) {
                                setState(() {
                                  isTrue = true;
                                });
                                onLoginPress();
                                /*https://www.youtube.com/watch?v=2u_rNrqQaFE*/
                              } else {
                                print("FIELDS are empty !!!");
                              }
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                            },
                            child:
                                Container(
                                  height: 50,
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      color: Colors.deepOrange[500]),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          fontFamily: "OpenSans"),
                                    ),
                                  ),
                                ),
                          ),

                          SizedBox(height: 10.0,),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  SignUp();
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "Don't have account?  ",
                                      style: TextStyle(
                                          color:
                                          Theme.of(context).accentColor,
                                          fontSize: 16,
                                          fontFamily: "OpenSans"),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Register Now",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16,
                                              fontFamily: "OpenSans"),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 30.0),

                          isTrue
                              ? CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                          )
                              :Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onLoginPress() async{
    if(email==null){
      var snackbar = SnackBar(
          content: Text(
            "You have to register first..",
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 3000));
      scaffoldKey.currentState.showSnackBar(snackbar);
      setState(() {
        isTrue = false;
      });
    }else if(emailController.text==email && pwdController.text==password){
      if(role==null){
        var snackbar = SnackBar(
            content: Text(
              "You have to register first..",
              textAlign: TextAlign.center,
            ),
            duration: Duration(milliseconds: 3000));
        scaffoldKey.currentState.showSnackBar(snackbar);
        setState(() {
          isTrue = false;
        });
      }else if(role=="Admin"){
        Navigator.pushAndRemoveUntil(context, ScaleRoute(page:LandingScreenAdmin()), ModalRoute.withName('/LandingScreenAdmin'));
        await storage.write(key: "LogIn", value: "1");
      }else if(role=="User"){
        Navigator.pushAndRemoveUntil(context, ScaleRoute(page:LandingScreen()), ModalRoute.withName('/LandingScreen'));
        await storage.write(key: "LogIn", value: "1");
      }
    }else{
      var snackbar = SnackBar(
          content: Text(
            "Invalid Username or Password..",
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 3000));
      scaffoldKey.currentState.showSnackBar(snackbar);
      setState(() {
        isTrue = false;
      });
    }
  }


  getData() async {
    email = await storage.read(key: "Email_Id");
    password = await storage.read(key: "Password");
    role= await storage.read(key: "Role");
    print("Role"+role);
  }

  SignUp() {
    Navigator.push(
        context,
        ScaleRoute(
            page:SignUpScreen()));
  }
}
