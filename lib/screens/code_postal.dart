import 'package:auth_and_sign_in/screens/nb_personne.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Formulaire.dart';

class Codepostal extends StatefulWidget{

  Codepostal({Key key, @required this.form}) : super (key: key);
  final Formulaire form;

  @override
  _CodepostalState createState() => _CodepostalState();
}

class _CodepostalState extends State<Codepostal> {
    final number = TextEditingController();

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
                  margin: EdgeInsets.only(top: 70,left: 300),
              width: 70.0,
              height: 60.0,
              decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage('images/Logo.png')
                )
             )),
             new SizedBox(height: 40,),
                new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text("Votre Code Postal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    new SizedBox(height: 20,),
                    new Text("La palce dans laquelle vous etes actuellement ? ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontStyle: FontStyle.italic),),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new TextField(
                      style: TextStyle(color: Colors.black.withOpacity(0.8),fontStyle: FontStyle.italic),
                      decoration: new InputDecoration(labelText: "saisir"),
                      controller: number,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                     ],
                    ),
                     new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                  ],
                )),
              ],
            ),
          ),
          SingleChildScrollView(
              child: Container(
               margin: EdgeInsets.only(top: 230),
               child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                   new Container(
                         child:  new MaterialButton( 
                                  height: 60.0, 
                                  minWidth: 350.0, 
                                  color: Color(0xFFDD208A), 
                                  textColor: Colors.white, 
                                  child: new Text("Suivant "), 
                                  onPressed: (){widget.form.code=int.parse(number.text); Navigator.push(context, MaterialPageRoute(builder: (context)=>Nombrepersonne(form: widget.form,)),);},
                                  splashColor: Colors.redAccent,
                                  shape: RoundedRectangleBorder(side: BorderSide(
                                  color: Color(0xFFDD208A),
                                  width: 1,
                                  style: BorderStyle.solid
                                  ), borderRadius: BorderRadius.circular(20)),
                             ),
                        margin: new EdgeInsets.only(top: 20.0),
                    ),
                  ],),
             ),
          ),
        ],
      ),
    );
     }
}
   