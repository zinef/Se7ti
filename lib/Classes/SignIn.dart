
import 'package:auth_and_sign_in/Classes/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  //une méthode async pour le login
  Future<void> signIn() async {
    //validation du fomulaire
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      //acceder à firebase
      try{
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password); 
        //connection , si les données ne sont pas correctes , elle va lever une exception
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(user: result.user,)));
      }catch(e){
        print(e.message);
      }
    }
    
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child:Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Veuillez introduire votre Email';
                }
                return null;
              },
              onSaved: (input)=> _email=input,
              decoration: InputDecoration(
                labelText: 'Email',

              ),
            ),
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Veuillez introduire votre Mot de passe ';
                }
                return null;
              },
              onSaved: (input)=> _password=input,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
             child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}