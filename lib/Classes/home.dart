import 'package:auth_and_sign_in/acceuil_screens/acceuil.dart';
import 'package:auth_and_sign_in/screens/home_material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldStae = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(user: widget.user),
      key: _scaffoldStae,
      appBar: AppBar(
        title: Text('Acceuil'),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldStae.currentState.openDrawer();
            }),
      ),
      body: Center(
        child: AcceuilScreen(),
        //Text('Welcome to you ${widget.user.email}'),
      ),
    );
  }
}
