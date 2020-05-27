import 'package:auth_and_sign_in/Classes/SignIn.dart';
import 'package:auth_and_sign_in/Classes/SignUp.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Welcome to CovApp"),
          ),
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(),fullscreenDialog: true,));
          }, child: Text("Sign In")
          ),
          FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage(),fullscreenDialog: true,));
          }, child: Text("Sign Up"))
        ],
      ),
    );
  }
}