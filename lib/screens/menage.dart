import 'package:flutter/material.dart';
import 'Formulaire.dart';
import 'merci_from.dart';

class Menage extends StatelessWidget{
  Menage({Key key, @required this.form}) : super (key: key);
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Est-ce-que quelqu'un de votre ménage a des symptomes? ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    new SizedBox(height: 20,),
                    new Text("Symptomes pseudo-grippaux comme fievre, toux, etc",style: TextStyle(color: Colors.black.withOpacity(0.6),fontStyle: FontStyle.italic),),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new SizedBox(height: 20,),
                    new Row(children: <Widget>[
                      new SizedBox(width: 10,),
                              new SizedBox(width: 20,),
                              new SizedBox(width: 20,),
                       new MaterialButton( 
                         height: 40.0, 
                         minWidth: 80.0, 
                         color: Color(0xFFFAFAFA), 
                         textColor: Colors.black38, 
                         child: new Text("Oui"), 
                         onPressed: (){ form.menage="oui"; Navigator.push(context, MaterialPageRoute(builder: (context)=>Merci(form: form,)),);},
                         splashColor: Colors.redAccent,
                         shape: RoundedRectangleBorder(side: BorderSide(
                      color: Colors.blue,
                      width: 1,
                      style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(50)),
                         ),
                              new SizedBox(width: 20,),
                              new SizedBox(width: 20,),
                              new SizedBox(width: 20,),
                               new MaterialButton( 
                         height: 40.0, 
                         minWidth: 80.0, 
                         color: Color(0xFFFAFAFA), 
                         textColor: Colors.black38,
                         child: new Text("Non"), 
                         onPressed: (){ form.menage="Non"; Navigator.push(context, MaterialPageRoute(builder: (context)=>Merci()),);},
                         splashColor: Colors.redAccent,
                         shape: RoundedRectangleBorder(side: BorderSide(
                         color: Colors.blue,
                         width: 1,
                         style: BorderStyle.solid
                         ), borderRadius: BorderRadius.circular(50)),
                         ),
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
                           onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Merci()),);},
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