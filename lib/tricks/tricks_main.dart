import 'package:flutter/material.dart';
import 'package:hackerstudiopro/main_screen.dart';
import 'package:hackerstudiopro/tricks/contents/eight.dart';
import 'package:hackerstudiopro/tricks/contents/five.dart';
import 'package:hackerstudiopro/tricks/contents/four.dart';
import 'package:hackerstudiopro/tricks/contents/nine.dart';
import 'package:hackerstudiopro/tricks/contents/one.dart';
import 'package:hackerstudiopro/tricks/contents/seven.dart';
import 'package:hackerstudiopro/tricks/contents/six.dart';
import 'package:hackerstudiopro/tricks/contents/three.dart';
import 'package:hackerstudiopro/tricks/contents/two.dart';

class TricksMain extends StatefulWidget {
  @override
  _TricksMainState createState() => _TricksMainState();
}

class _TricksMainState extends State<TricksMain> {
 @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          // Here the height of the container is 45% of our total height
          height: size.height * .35,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        SafeArea(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen())),
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        // color:Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    height: 200,
                    width: 352,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                    ),
                    child: Image.asset("assets/images/e.png"),
                  ),
                ),
              ],
            ),
            Text(
              "Hacking Tricks",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              "Learn How to perform some interesting Hacks",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Course Contents",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksFirst())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "How to hide a file behind an image",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Basics of Steganography"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksTwo())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "How to make a Private Folder",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Private folder which nobody can open, delete, see properties, rename"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksThree())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "Hack into Android Phone",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Gain Complete Control of Any Android Phone with the AhMyth RAT"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksFour())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "Hack Gmail Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Hack Gmail Account With Hydra Brute Force Attack"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                   Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksSeven())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "How to Hack into a Windows10 Machine",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to Attack Windows 10 Machine with Metasploit on Kali Linux"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksFive())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "Making the Windows10 Executable FUD with Shellter",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to Making the Reverse Shell Executable FUD"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksSix())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "Privilege Escalation",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Elevate privileges from our less privileged user (l3s7r0z) to a more privileged one"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksEight())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "How to Hack a macOS Machine",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to Use One Python Command to Bypass Antivirus Software on macOS in 5 Seconds"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TricksNine())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.orange,
                          size: 40,
                        ),
                        title: Text(
                          "How to Spear Phish",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to Spear Phish with the Social Engineering Toolkit (SET) in Kali Linux"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  
                 
                  
                  
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
