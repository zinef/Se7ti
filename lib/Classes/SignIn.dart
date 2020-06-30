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
      //acceder à firebase
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        
        //connection , si les données ne sont pas correctes , elle va lever une exception
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: result.user,)));
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xffCCF7FF),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              'SIGN IN',
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
              /*Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  fontFamily: "Pacifico",
                ),
                textAlign: TextAlign.center,
              ),*/
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                          colors: [
                            const Color(0xff00d0e1),
                            const Color(0xff00b3fa)
                          ],
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
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 23,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            height: 1.0434782608695652,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: signIn,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 12,
                          color: const Color(0xff4a4a4a),
                          height: 2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Mot de passe ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'oublié',
                            style: TextStyle(
                              color: const Color(0xff317adb),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' ?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.only(left: 90, right: 90, bottom: 300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset('images/fb.png'),
                          Image.asset('images/Googleicon.png'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
