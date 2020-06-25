import 'package:flutter/material.dart';
import 'algeria_card.dart';
import 'global_card.dart';

class AcceuilScreen extends StatelessWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final String _info =
      'Description de l\'information , Ceci est une description de l\'épidémie concerné par la période du temps dont l\'utilisateur l\'utilise';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: SideMenu(),
      //key: _scaffoldKey,
      /*appBar: AppBar(
        title: Text('Acceuil'),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
      ),*/
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          //Debut: Container d'information Epidémie
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment(-1.28, -1.0),
                end: Alignment(2.91, 4.22),
                colors: [
                  const Color(0xff00e4ff),
                  const Color(0xff06b5cb),
                  const Color(0xff026470)
                ],
                stops: [0.0, 0.803, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x14000000),
                  offset: Offset(1, 1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25, top: 18, bottom: 8),
                child: Text(
                  'Covid 19 ',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 34, bottom: 20),
                child: Text(
                  _info,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 12,
                    color: const Color(0xffffffff),
                    letterSpacing: 0.12,
                    fontWeight: FontWeight.w300,
                    height: 1.25,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
          //Fin: Container d'information Epidémie
          //Debut: Global Card
          GlobalCard(),
          //Fin: Global Card
          //Debut: Algeria Card
          AlgeriaCard(),
          //Fin
        ],
      ),
    );
  }
}
