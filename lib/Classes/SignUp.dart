import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _email,_password;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  Future<void> signUp() async {
    //validation du fomulaire
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      //ajouter le compte à la base de données
      try{
        AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password); 
        result.user.sendEmailVerification();
        Navigator.of(context).pop();
      }catch(e){
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
              onPressed: signUp,
             child: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}