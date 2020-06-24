import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyOne extends StatefulWidget {
  @override
  _BountyOneState createState() => _BountyOneState();
}

class _BountyOneState extends State<BountyOne> {
  var text = '''
  Whether you are a seasoned penetration tester or just starting in the game, scanning and hacking web applications has probably been discussed over and over again. I am not going to compare in detail all the different vulnerability scanners, SNMP scanners and so on, but I will try to give you my most efficient process for scanning and exploiting web apps.

Before you ever even start performing any OSINT tests, it is best if you create fake social media accounts. Some examples of these might be (the more you have the better):
● LinkedIn
● Twitter
● Google+
● Facebook
● Instagram
● MySpace
● Glassdoor
You don’t want to use your own personal accounts as many of the sites show who visited your pages. This could be a quick way to get identified and potentially kill your whole mission. Now that we are ready with the OSINT setup, let’s start hacking.

Using Compromised Lists To Find Email Addresses And Credentials

The great thing about being a penetration tester is that you have to get creative and use all sorts of resources, just as if someone was malicious. One tactic that I have found to be very fruitful in the past is using known credential dumps for password reuse. Let me explain a little more in detail. There was a large breach of Adobe's systems. The compromised information consisted of email addresses, encrypted passwords, and their password hints.{2} The large dump, which was almost 10 Gigabytes, was released privately in small circles and is now publicly available (try searching for Adobe and users.tar.gz). From an attacker's perspective this is a gold mine of information. What I generally do is parse through this file and identify the domains against which I am doing a test.

Well my advice to you that wants to learn web hacking is that try to learn how to find and exploit one bug and look for it everywhere. You might be surprised on what you'll find but it won't be too easy.
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
                Text("Introduction to Web Hacking",
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
