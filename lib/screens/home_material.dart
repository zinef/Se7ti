import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Color couleur =  Colors.white;
  bool isNotificationSwitched = true;
  bool isLoctionSwitched = true;
  bool isBluetoothSwitched = false;
  bool isModeNuitSwitched = false;

  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: <Widget>[
                new SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.only(left: 0,right: 170,),
                    width: 70.0,
                    height: 65.0,
                    decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new AssetImage('images/Logo.png')
                    )
                    )),
                Container(
                  //color : Color(0xFF00E4FF),
                   margin: const EdgeInsets.all(10.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: new BoxDecoration(
                    color: Color(0xFF00E4FF),
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                    colors: [Color(0xFF00E4FF), Color(0xFF06B5CB)],
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter),
                   border: new Border.all(color: Color(0xFF00E4FF))
                    ),
                  child: Column(
                    children: <Widget>[
                      new SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Container(
                          width: 65.0,
                          height: 65.0,
                          decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: new Border.all(color: Colors.black),
                          image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new AssetImage('images/1.jpg')
                          )
                          )),
                          new SizedBox(width: 10),
                          new Column( children: <Widget>[
                            new Text("Abdelliche Youcef",style: TextStyle(fontSize: 15.0)),
                            new Text("hy_abdelliche@esi.dz",style: TextStyle(fontSize: 13.0)),
                          ],
                          ),
                        ],
                      ),
                      new SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  title: Text(
                    'Acceuil',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Fil d\'actualité',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Etat de santé et formulaires',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Preventions',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Symptomes',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Questions populaires',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Guider un patient ',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      color: const Color(0xb2333333),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                    title: Text(
                  'Paramètres',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    color: const Color(0xff333333),
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                )),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Notifications',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          color: const Color(0xff707070),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Center(
                        child: Switch(
                          value: isNotificationSwitched,
                          onChanged: (value) {
                            setState(() {
                              isNotificationSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red[200],
                          inactiveThumbColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Location',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          color: const Color(0xff707070),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Center(
                        child: Switch(
                          value: isLoctionSwitched,
                          onChanged: (value) {
                            setState(() {
                              isLoctionSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red[200],
                          inactiveThumbColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Bluetooth',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          color: const Color(0xff707070),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Center(
                        child: Switch(
                          value: isBluetoothSwitched,
                          onChanged: (value) {
                            setState(() {
                              isBluetoothSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red[200],
                          inactiveThumbColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Mode nuit',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          color: const Color(0xff707070),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Center(
                        child: Switch(
                          value: isModeNuitSwitched,
                          onChanged: (value) {
                            setState(() {
                              isModeNuitSwitched = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.red[200],
                          inactiveThumbColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      );
  }
}
//https://www.youtube.com/watch?v=oExw0U4U_UI form:https://www.youtube.com/watch?v=IxCeJS9yA8w drop : https://www.youtube.com/watch?v=yV5Ev_hI4Qo
