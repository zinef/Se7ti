import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Formulaire.dart';

class Merci extends StatelessWidget {
  final db = Firestore.instance;
  Merci({Key key, @required this.form}) : super(key: key);
  final Formulaire form;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 70, left: 300),
                    width: 70.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage('images/Logo.png')))),
                new SizedBox(
                  height: 40,
                ),
                new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Merci de remplir ce formulaire",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new Text(
                          "Votre ménage est protégé contre cette épédimie ",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontStyle: FontStyle.italic),
                        ),
                        new Text(
                          "Partagez cette application et non pas le virus ",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontStyle: FontStyle.italic),
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: const DecorationImage(
                                image: AssetImage("images/smile.png"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                        new SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new MaterialButton(
                      height: 60.0,
                      minWidth: 350.0,
                      color: Color(0xFFDD208A),
                      textColor: Colors.white,
                      child: new Text("Envoyer "),
                      onPressed: () async {
                        await db.collection("formulaires").add({
                          'wilaya': form.wilaya,
                          'code': form.code,
                          'nbpers': form.nbpers,
                          'menage': form.menage,
                        });
                        Navigator.of(context)
                            .popUntil(ModalRoute.withName("/Page1"));
                      },
                      splashColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color(0xFFDD208A),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
