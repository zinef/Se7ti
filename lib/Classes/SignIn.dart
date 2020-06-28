import 'package:auth_and_sign_in/Classes/home.dart';
import 'package:auth_and_sign_in/Classes/result_formulaires.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //une méthode async pour le login
  Future<void> signIn() async {
    //validation du fomulaire
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Widget widget;
      //acceder à firebase
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        var data;
        await Firestore.instance
            .collection('users')
            .where('email', isEqualTo: _email)
            .getDocuments()
            .then((value) {
          value.documents.forEach((result) {
            data = result.data;
          });
        });
        if (data['isAdmin']) {
          widget = Scaffold(
            appBar: AppBar(title: Text('Welcome Admin')),
            body: ResultFormulaire(),
           floatingActionButton: Visibility(
          visible: true,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
                child: Icon(Icons.add, color: Colors.black,), onPressed: () {}))
          );
        } else {
          widget = Home(
            user: result.user,
          );
        }
        //connection , si les données ne sont pas correctes , elle va lever une exception
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[400],
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                fontFamily: "Pacifico",
              ),
              textAlign: TextAlign.center,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Veuillez introduire votre Email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Veuillez introduire un Mot de passe ';
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0),
                    child: FlatButton(
                      onPressed: signIn,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
