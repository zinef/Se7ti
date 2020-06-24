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
    return Container(
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: AssetImage("images/WelcomePage.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SE7TI",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  fontFamily: "Pacifico",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Ceci est le welcome page de l'application du volet numéro 1",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  fontFamily: "SourceSansPro",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right:20.0 ,bottom: 10.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                        fullscreenDialog: true,
                      ));
                },
                child: Text("Sign In"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.white,
                    )),
                color: Colors.transparent,
                textColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right:20.0 ,bottom: 30.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                        fullscreenDialog: true,
                      ));
                },
                child: Text("Sign Up"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.blue[300],
                    )),
                color: Colors.blue[300],
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
