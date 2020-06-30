import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    //validation du fomulaire
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //ajouter le compte à la base de données
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        result.user.sendEmailVerification();
        await Firestore.instance
            .collection('users')
            .add({'isAdmin': false, 'email': _email});
        Navigator.of(context).pop();
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Color(0xffCCF7FF),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(child: Image.asset('images/circle.png')),
                  Container(
                      padding: EdgeInsets.only(top: 60),
                      child:
                          Center(child: Image.asset('images/doctorimg.png'))),
                  Container(
                    padding: EdgeInsets.only(
                        top: 220, left: 20, right: 20, bottom: 40),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Center(
                          child: SizedBox(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 18,
                                color: const Color(0xff008ca5),
                                letterSpacing: 0.36,
                                fontWeight: FontWeight.w500,
                                height: 1.3333333333333333,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                height: 58.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
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
                      alignLabelWithHint: true,
                      //labelText: 'Email',
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(20),
                height: 58.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Veuillez introduire un Mot de passe ';
                      }
                      return null;
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(44),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, -1.0),
                    end: Alignment(1.0, 1.0),
                    colors: [const Color(0xff00d0e1), const Color(0xff00b3fa)],
                    stops: [0.0, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: FlatButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 23,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      height: 1.0434782608695652,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: signUp,
                ),
              ),
              /*RaisedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
