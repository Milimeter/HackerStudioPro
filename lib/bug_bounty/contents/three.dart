import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyThree extends StatefulWidget {
  @override
  _BountyThreeState createState() => _BountyThreeState();
}

class _BountyThreeState extends State<BountyThree> {
  var text = '''
  Using Compromised Lists To Find Email Addresses And Credentials

The great thing about being a penetration tester is that you have to get creative and use all sorts of resources, just as if someone was malicious. One tactic that I have found to be very fruitful in the past is using known credential dumps for password reuse. Let me explain a little more in detail. There was a large breach of Adobe's systems. The compromised information consisted of email addresses, encrypted passwords, and their password hints.{2} The large dump, which was almost 10 Gigabytes, was released privately in small circles and is now publicly available (try searching for Adobe and users.tar.gz). From an attacker's perspective this is a gold mine of information. What I generally do is parse through this file and identify the domains against which I am doing a test.Of course, it is important to see if this type of testing is in the scope of your engagement and that youaren't breaking any laws by obtaining a copy of any password/compromised  lists. If it is a full blackbox test, this should definitely be a part of your attacking approach. For example, in the image below, I will search (using the Linux grep command: grep "@yahoo.com" cred > hashlist.txt) through the Adobe password list for a sample domain of yahoo.com and write that to a file named hashlist.txt (remember you should search for the domain for which you are testing). We can see that there are many users (which I redacted) with an email address containing yahoo that have an encrypted password and password hint.
  

Based on the hints, you could do some research and find out who a specific user's boyfriend is or the name of their cat, but I usually go for the quick and dirty attempt. I was able to find two groups of researchers who, based on patterns and hints, were able to reverse some of the encrypted passwords. Remember that from the Adobe list, since the passwords aren't hashes but encrypted passwords, trying to reverse the passwords is much more difficult without the key. The reversed list I was able to identify is:
● http://stricture-group.com/files/adobe-top100.txt
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
                Text("Creating Password Lists",
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
