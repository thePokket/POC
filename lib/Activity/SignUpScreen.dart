import 'package:aatmanapp/Activity/LoginScreen.dart';
import 'package:aatmanapp/Helper/FadeAnimation.dart';
import 'package:aatmanapp/Helper/ScaleRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var currentSelectedLocation = "Select Location";
  var currentSelectedRole = "Select Role";

  static final GlobalKey<FormState> formKey = new GlobalKey();
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  final TextEditingController fullNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();
  final TextEditingController cnfrmPwdController = new TextEditingController();
  final TextEditingController mobileController = new TextEditingController();
  final TextEditingController orgIdController = new TextEditingController();
  final TextEditingController whoYouAreController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();

  FocusNode emailnode = new FocusNode();
  FocusNode fullNameNode = new FocusNode();
  FocusNode pwsnode = new FocusNode();
  FocusNode confrmPwsnode = new FocusNode();
  FocusNode mobilenode = new FocusNode();
  FocusNode orgnode = new FocusNode();

  String email,password;

  var whoYouAre=[
    "User",
    "Admin"
  ];

  var location=[
    "Aurus Hinjewadi",
    "Aurus Nigdi",
    "Aurus Khadki",
    "Aurus Talegaon"
  ];

  final storage = FlutterSecureStorage();

  bool _obscureTextConfirm = true, isTrue = false;

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
                          "Sign Up.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
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
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 60,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Full Name',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  controller: fullNameController,
                                  focusNode: fullNameNode,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(emailnode);
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter FullName";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Email Id',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  focusNode: emailnode,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(mobilenode);
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Email Id";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  controller: mobileController,
                                  focusNode: mobilenode,
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context).requestFocus(orgnode);
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Mobile Number";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45, width: 1.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Organisation Id',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  controller: orgIdController,
                                  focusNode: orgnode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Organisation Id";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                DropdownButton<String>(
                                  hint: Text(
                                    currentSelectedLocation,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontFamily: "OpenSans",
                                        fontSize: 14.0),
                                  ),
                                  value: null,
                                  items:
                                  location.map((String brands) {
                                    return DropdownMenuItem<String>(
                                      value: brands,
                                      child: Text(
                                        brands,
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontFamily: "OpenSans",
                                            fontSize: 16.0),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String brandSelected) {
                                    setState(() {
                                      this.currentSelectedLocation =
                                          brandSelected;
                                    });
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                DropdownButton<String>(
                                  hint: Text(
                                    currentSelectedRole,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontFamily: "OpenSans",
                                        fontSize: 14.0),
                                  ),
                                  value: null,
                                  items:
                                  whoYouAre.map((String brands) {
                                    return DropdownMenuItem<String>(
                                      value: brands,
                                      child: Text(
                                        brands,
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontFamily: "OpenSans",
                                            fontSize: 16.0),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String brandSelected) {
                                    setState(() {
                                      this.currentSelectedRole =
                                          brandSelected;
                                    });
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          _toggleConfirm();
                                        },
                                        child: _obscureTextConfirm
                                            ? Icon(Icons.visibility_off, color: Colors.grey)
                                            : Icon(Icons.visibility,
                                            color: Theme.of(context).accentColor)),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  obscureText: _obscureTextConfirm,
                                  textInputAction: TextInputAction.done,
                                  controller: pwdController,
                                  focusNode: pwsnode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10.0,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45,
                                          width: 1.0,
                                          style: BorderStyle.solid),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Confirm Password',
                                    labelStyle: TextStyle(
                                        fontStyle: FontStyle.normal,fontFamily: "OpenSans", fontSize: 12.0),
                                  ),
                                  obscureText: _obscureTextConfirm,
                                  textInputAction: TextInputAction.done,
                                  controller: cnfrmPwdController,
                                  focusNode: confrmPwsnode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
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
                                      onSignUpPress();
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
                                        "SignUp",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            fontFamily: "OpenSans"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  onSignUpPress() async{
    await storage.write(key: "Full_Name", value: fullNameController.text);
    await storage.write(key: "Email_Id", value: emailController.text);
    await storage.write(key: "MobileNo", value: mobileController.text);
    await storage.write(key: "Org_Id", value: orgIdController.text);

    if(pwdController.text==cnfrmPwdController.text){
      await storage.write(key: "Password", value: pwdController.text);
    }else{
      var snackbar = SnackBar(
          content: Text(
            "Password does not match",
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 3000));
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
    await storage.write(key: "Location", value: currentSelectedLocation);
    await storage.write(key: "Role", value: currentSelectedRole);
    Navigator.pushAndRemoveUntil(context, ScaleRoute(page:LoginScreen()), ModalRoute.withName('/LoginScreen'));
  }
}
