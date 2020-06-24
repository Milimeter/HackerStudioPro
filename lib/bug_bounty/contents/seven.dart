import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountySeven extends StatefulWidget {
  @override
  _BountySevenState createState() => _BountySevenState();
}

class _BountySevenState extends State<BountySeven> {
  var text = '''
  It is pretty straightforward to start and kick off a vulnerability scan as your tasks should be pre-populated at the bottom pane of Greenbone Security Desktop. Once you see your task, you can right-click on that task and click “Start.”
  ''';
  var text1 = '''

  Once the scan completes, you can go over to the report tab or export the report to a PDF format.
  ''';
  var text2 = '''
  This vsftpd vulnerability was the one that we found on the Metasploitable 2 box, which we used to
exploit with Metasploit in the prior section.
  ''';
  var text3 = '''

  Vulnerability scanning is still an important factor in any penetration test, though it definitely is not the
be-all and end-all for offensive testing. If you look at real world examples, other than external
scanning, most attacks do not incorporate a lot of internal scans. This is because they are loud, trigger
intrusion detection systems, and, at times, take down services. Instead, they focus on moving quietly
through the network, taking knowledge gained from each step to move laterally, and the importance of
data exfiltration.
  ''';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WebMain())),
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
                Text("Vulnerability Scanning 2",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Text(
                          text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(
                            child: Image.asset('assets/images/ovas3.jpg')),
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(
                            child: Image.asset('assets/images/ovas4.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(
                            child: Image.asset('assets/images/ovas5.jpg')),
                            Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        RaisedButton(
                          child: Text(
                              "Follow me on Social Media if you have Questions"),
                          onPressed: () {
                            followMe();
                          },
                          color: Color(0xFFF2BEA1),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void followMe() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFFF5CEB8),
            title: Text('Follow me'),
            content: Text("Twitter: @Millime64755564"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text('Exit'))
            ],
          );
        });
  }
}
