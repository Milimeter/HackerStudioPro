import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountySix extends StatefulWidget {
  @override
  _BountySixState createState() => _BountySixState();
}

class _BountySixState extends State<BountySix> {
  var text = '''
  Openvas
(http://www.openvas.org/)(Kali)
 I want to be able to complement them with Open Source tools. There is a decent open source vulnerability tool that you can also use in your arsenal. Open Vulnerability Assessment System (OpenVAS) is a great tool for learning and testing vulnerabilities. Compared to the commercial tools, from my experience, OpenVas does pick up a lot of the similar findings, but I have noticed on engagements that it misses potentially high findings. I have also noticed that with OpenVAS, I had a lot of trouble when thingsbreak. When it breaks, it breaks hard and a lot of manual work is needed to get it back up and running. The positive side of OpenVAS is that it does do all the things required by a scanner. It can run different configurations, do authenticated scans, create reports, and even distribute scans over multiple nodes. To get OpenVAS up and running, from a command prompt on your Kali host, type:
● openvas-setup
● openvas-scapdata-sync
● openvas-certdata-sync
● openvas-adduser
● gsd
  ''';
  var text1 = '''

  Once you login, you can go right to starting a scan:
● Tasks -> New
● Click on the Blue Star on Scan Targets
● Add your IP ranges and Create the Scan
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
                Text("Vulnerability Scanning 1",
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
                       Container(child: Image.asset('assets/images/ovas.jpg')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/ovas1.jpg')),
                        Container(child: Image.asset('assets/images/ovas2.jpg')),
                        
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
