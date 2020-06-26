import 'package:auth_and_sign_in/screens/menage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Formulaire.dart';


class Nombrepersonne extends StatefulWidget{

  Nombrepersonne({Key key, @required this.form}) : super (key: key);
  final Formulaire form;

  @override
  _NombrepersonneState createState() => _NombrepersonneState();
}

class _NombrepersonneState extends State<Nombrepersonne> {
  final number0 = TextEditingController();

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
             new SizedBox(height:20,),
                new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Nombre de personnes avec vous",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    new SizedBox(height: 20,),
                    new Text("Vous etes inclus, S'il vous plait faites en sorte qu'une seule personne qui remplie ce formulaire chaque jour ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontStyle: FontStyle.italic),),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new TextField(
                      style: TextStyle(color: Colors.black.withOpacity(0.8),fontStyle: FontStyle.italic),
                      decoration: new InputDecoration(labelText: "saisir"),
                      controller: number0,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                     ]  , // Only numbers can be entered
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
                                onPressed: (){widget.form.nbpers=int.parse(number0.text); Navigator.push(context, MaterialPageRoute(builder: (context)=>Menage(form: widget.form,)),);},
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