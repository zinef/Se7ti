import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultFormulaire extends StatefulWidget {
  @override
  _ResultFormulaireState createState() => _ResultFormulaireState();
}

class _ResultFormulaireState extends State<ResultFormulaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Admin')),
      floatingActionButton: Visibility(
          visible: true,
          child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {})),
      body: StreamBuilder(
          stream: Firestore.instance.collection('formulaires').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                      Text('Loading...'),
                    ],
                  ),
                ),
              );
            }
            return ListView(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Formulaires',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 20,
                        color: const Color(0xff333333),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 13,
                        color: const Color(0xff959595),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: ScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(20),
                  margin:
                      EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x14000000),
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '- Wilaya: ${snapshot.data.documents[index]['wilaya']}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 13,
                          color: const Color(0xff959595),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '- Code postal: ${snapshot.data.documents[index]['code']}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 13,
                          color: const Color(0xff959595),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '- Nombre de personnes: ${snapshot.data.documents[index]['nbpers']}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 13,
                          color: const Color(0xff959595),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '- Est-ce-que quelqu\'un de votre ménage a des symptomes: ${snapshot.data.documents[index]['menage']}',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 13,
                          color: const Color(0xff959595),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          }),
    );
  }
}
