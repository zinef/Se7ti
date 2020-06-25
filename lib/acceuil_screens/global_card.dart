import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GlobalCard extends StatefulWidget {
  @override
  _GlobalCardState createState() => _GlobalCardState();
}

class _GlobalCardState extends State<GlobalCard> {
  final String url = 'https://disease.sh/v2/all';
  var data;

  Future getDataCovid() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var responseBody = jsonDecode(response.body);
      data = responseBody;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: FutureBuilder<dynamic>(
            future: getDataCovid(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Column(children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 23, left: 25, bottom: 27),
                        child: Text(
                          'Global',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            color: const Color(0xff16335c),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        )),
                    Container(
                        child: Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 25),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 9),
                                child: Text(
                                  'Cas confirmés',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${snapshot.data['cases']}',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 20,
                                    color: const Color(0xff5a93ff),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                  child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Nouveau: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '+${snapshot.data['todayCases']}',
                                      style: TextStyle(
                                        color: const Color(0xff5a93ff),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ))
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 9),
                                child: Text(
                                  'Cumul de décès',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    '${snapshot.data['deaths']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xffFF5A5A),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                  child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Nouveau: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '+${snapshot.data['todayDeaths']}',
                                      style: TextStyle(
                                        color: const Color(0xffFF5A5A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ))
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 9),
                                child: Text(
                                  'Retour à domicile',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    '${snapshot.data['recovered']}',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xff42BE00),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  )),
                              Container(
                                  child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 10,
                                    color: const Color(0xff707070),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Nouveau: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '+${snapshot.data['todayRecovered']}',
                                      style: TextStyle(
                                        color: const Color(0xff42BE00),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ))
                            ],
                          ))
                    ])),
                    Container(
                        padding: EdgeInsets.only(left: 25, top: 20, bottom: 20),
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 10,
                              color: const Color(0xff707070),
                            ),
                            children: [
                              TextSpan(
                                text: 'dernière modification:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: DateTime.fromMillisecondsSinceEpoch(
                                        snapshot.data['updated'])
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ))
                  ], crossAxisAlignment: CrossAxisAlignment.start)
                ];
              } else {
                children = <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 16,bottom: 16),
                    child: Text('Awaiting result...'),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            })
        /**/);
  }

  @override
  void initState() {
    super.initState();
    this.getDataCovid();
  }
}
