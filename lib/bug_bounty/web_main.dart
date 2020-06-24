import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/contents/eleven.dart';
import 'package:hackerstudiopro/bug_bounty/contents/five.dart';
import 'package:hackerstudiopro/bug_bounty/contents/four.dart';
import 'package:hackerstudiopro/bug_bounty/contents/fourteen.dart';
import 'package:hackerstudiopro/bug_bounty/contents/nine.dart';
import 'package:hackerstudiopro/bug_bounty/contents/one.dart';
import 'package:hackerstudiopro/bug_bounty/contents/seven.dart';
import 'package:hackerstudiopro/bug_bounty/contents/six.dart';
import 'package:hackerstudiopro/bug_bounty/contents/ten.dart';
import 'package:hackerstudiopro/bug_bounty/contents/thirteen.dart';
import 'package:hackerstudiopro/bug_bounty/contents/three.dart';
import 'package:hackerstudiopro/bug_bounty/contents/twelve.dart';
import 'package:hackerstudiopro/bug_bounty/contents/two.dart';
import 'package:hackerstudiopro/main_screen.dart';

class WebMain extends StatefulWidget {
  @override
  _WebMainState createState() => _WebMainState();
}

class _WebMainState extends State<WebMain> {
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
              "Web Based Exploitation",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              "Learn how to take over the Web",
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyOne())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Introduction to Web Hacking",
                          style: TextStyle(fontWeight: FontWeight.bold), 
                        ),
                        subtitle: Text(
                            "Learn how to get started with hacking web apps"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyTwo())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Passive and Active Discovery Process",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            " Using Open Source Intelligence to perform Recon "),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyThree())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Creating Password Lists",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to find more targeted information about your target"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyFour())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Digital Dumpster Diving",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text(" how to find potentially sensitive files"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyFive())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Contents Discovery and Spidering",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to find hidden paths and files with efficiency and effectiveness"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountySix())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Vulnerability Scanning 1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A few tools to help you with vulnerability scanning"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountySeven())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Vulnerability Scanning 2",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Finding potential vulnerabilities in a web Application"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyNine())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Exploiting SQL Injections",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Manipulating database queries,and dumping databases"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyTen())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Cross-Site Scripting",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            " A User attack that is caused by a lack of input validation by the application"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyEleven())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Cross-Site Request Forgery",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to force an unwanted action onto the victim"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyTwelve())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "XML External Entities",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Bypassing XML parsers to read arbitrary files"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyThirteen())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "File Upload Vulnerability",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("How to spawn a shell via File Upload"),
                        trailing: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ))),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BountyFourteen())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "GraphQL",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Learn how to exploit web services running GraphQL"),
                        trailing: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ))),
                  ),
                  Divider()
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
