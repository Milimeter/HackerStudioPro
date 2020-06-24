import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';

class BasicsSix extends StatefulWidget {
  @override
  _BasicsSixState createState() => _BasicsSixState();
}

class _BasicsSixState extends State<BasicsSix> {
  var text = '''
  Okay this is a personal one from me to you.

Anyone serious about learning hacking should make sure to go through all the relevant laws in their jurisdictions. For those who are not so serious, it is even more important. Simply goofing around may be enough to rack up a hefty fine, probation or even a sentence. In Germany, for example, simply owning a tool that can be used for hacking, is a crime. In the same country, a professional penetration tester or a 12 year old may be regarded as criminal hackers just because he or she downloaded a Cheat Engine( remember the Cheat Engine Part?) or Kali Linux. This is not to single out Germans but to show that imperfect laws still exist in almost every country's constitution(not to even mention Nigeria which is where i'm from).

Why bother with all this legal nonsense?. If you're not the type to spend your life fighting pointless politics of start protesting around to change existing laws, you need to follow them. After all, what choice do we have? Jail? Sure, why not. If you aren't against something, then by definition, you support it. Anyways, let's leave politics for another website.

When it comes to hacking, no matter where you live, practically doing it means walking a fine line. But, before anything else, before the law too, you need to look after yourself and make sure you aware of every possible consequence of performing a hack or anything even remotely  related. From running a batch files, which can wreck or crash your computer( trust me i've crashed many os'es in my journey of learning) to hacking your school's server(there is no way i am commenting on that) which can get you expelled to leaking NSA secrets(Edward Snoden) which can open the eyes of the world, you need to tread carefully. When it comes to hacking, there is no universal definition of right and wrong. 

Coming back to the limits of legality, what all is legal for an average person who wants to learn hacking? well the exact answer will depend on your address(another bug in the matrix..), there are some general things you should keep in mind while learning and carrying out different hacking techniques, no matter where you live. These are not only to keep you out of jail but also to protect you from yourself. Since our lives will just deep on getting more and more dependent on technology, hacking is no longer just about hacking. Plus, it won't hurt to double check what you are donin won't get you in trouble.

	Knowing what you are doing

Just one misplaced command in a batch file virus could spell disaster. As a rule of thumb: If you do not know what you are doing, don't do it. In the world of hacking, its easy to get carried away, especially when you try out something new, it works and you want more. Skippinng the learning phase and moving straight to the doing phase is what turns potential hackers int script kiddies.

Know the consequences of what you're doing. This is an extension of the previous point. Before performing any hack, you should always try to visualize exery step. See it in your mind, what all you need to do and what exactly is the expected outcome. You should try to avoid  involving someone else's property or devices when learning hacking(well i hack my friends and they are cool with it and some of them don't even know). If you stick to what you know, you should always be able to predict what will happen. That will leave only typos and genuine errors. hacking is not all theat dangerous and unpredictable if you know what you're doing.

It's great if you cna find a willing and trust-worthy friend and try hacking each other for learning. If you ever consider trying larger and more elaborate hacks, taking written permission from all the involved parties is a good idea.

Another example, hacking public(protected) WiFi(which is juicy by the way) is illegal. You could try knocking on your neighbour's door and advising them to switching over from WEP to WPA2 (that is if they even have one to start with). This is what puts the 'ethical' in 'ethical hacker' and the chances of them giving you the new password by simply asking also increase.

That's pretty much all a beginner hacker needs to know about the legal side of hacking. Once again, anything you do on your own computer that affects nobody else is usually safe for others. As the world is increasingly interconnected, everyone shares the responsibility of securing the cyberspace. Hence, it is better to be despised for anxious apprehensions, than ruined by superficial security.
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
                        MaterialPageRoute(builder: (context) => BasicsMain())),
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
                Text("Limits of Legality",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Container(child: Image.asset('assets/images/malware.jpg')),
                        SizedBox(height: 20),
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
