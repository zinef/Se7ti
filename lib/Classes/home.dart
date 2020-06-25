import 'package:auth_and_sign_in/acceuil_screens/acceuil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Center(
        child: AcceuilScreen(),
        //Text('Welcome to you ${widget.user.email}'),
      ),
    );
  }
}
