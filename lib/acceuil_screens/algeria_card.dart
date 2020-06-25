import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AlgeriaCard extends StatefulWidget {
  @override
  _AlgeriaCardState createState() => _AlgeriaCardState();
}

class _AlgeriaCardState extends State<AlgeriaCard> {
  final String url = 'https://disease.sh/v2/countries/algeria';

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
        margin: EdgeInsets.only(top: 20),
        /*padding: EdgeInsets.only(top: 11, bottom: 24),*/
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 19, left: 20),
                          child: Row(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image:
                                        const AssetImage('images/card-bg.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x14000000),
                                      offset: Offset(1, 1),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                child: Text(
                              'DZ, Alger',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 16,
                                color: const Color(0xff16335c),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 130),
                                child: FlatButton(
                                  onPressed: () {},
                                  child: SizedBox(
                                    width: 56.0,
                                    child: Text(
                                      'Changer',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 13,
                                        color: const Color(0xff0066a5),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ))
                          ]),
                        ),
                        Container(
                            child: Row(children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 35),
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
                                          text:
                                              '+${snapshot.data['todayCases']}',
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
                                          text:
                                              '+${snapshot.data['todayDeaths']}',
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
                            padding: EdgeInsets.only(left: 20, top: 10,bottom: 20),
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
                                    /*'${snapshot.data['Countries'][2]['Date']}',*/
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ))
                      ])
                ];
              } else {
                children = <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(16),
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
