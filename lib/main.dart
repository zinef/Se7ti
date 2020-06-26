import 'package:auth_and_sign_in/Classes/Welcome.dart';
import 'package:auth_and_sign_in/screens/Formulaire.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase avec flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
      
    );
  }
}

final Formulaire form=new Formulaire(null,null,null,null);
final List<String> wilaya = ["Adrar","Chlef","Laghouat","Oum bouaghi","Alger","Oran","Blida","Constantine","Sétif","Tizi Ouzou"] ;
String selectedItem = wilaya[0];
