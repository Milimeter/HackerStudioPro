import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';

class BasicsFirst extends StatefulWidget {
  @override
  _BasicsFirstState createState() => _BasicsFirstState();
}

class _BasicsFirstState extends State<BasicsFirst> {
  String text = '''   
      Computer hacking is the practice of altering computer hardware and software to carry out a goal outside of the creator's original intention. People who slot in computer hacking actions and activities are often entitled as hackers.

Nowadays, people think that hacking is only about hijacking facebok accounts or defacing websites. yes, it is also part of hacking but it doesn't mean that it is all there is. This is not even the tip of the iceberg.

The majority of people assume that hackers are computer criminals. They fall short to identify the fact that criminals and hackers are two entirely unrelated things. Media is liable for this. Hackers in realism are good and extremely 
intelligent people, who by using their knowledge in a constructive mode help organizations, companies, government, etc.
 to secure credentials and secret information on the Internet.

Years ago, no one had to worry about Crackers breaking into their computer and installing Trojan viruses, or using your
computer to send attacks against others. Now that thing have changed, it's best to be aware of how to defend your
computer from damaging intrusions and prevent black hat hackers. Rampant hacking is systematically victimizing
computers around the world. This hacking is not only common, but is being executed without a flaw that the attackers
compromise a system, steal everything of value and entirely rub out their pathway within 20 minutes. So, in this Book you
will uncover the finest ways to defend your computer systems from the hackers.

Steps Performed By hackers
1) Reconnaissance
2) Scanning
3) Gaining Access
4) Maintaining Access
5) Clearing Tracks
• Performing Reconnaissance
• Scanning and Enumeration
• Gaining access
• Maintaining access and Placing Backdoors
• Covering tracks or Clearing Logs

Phase I: Reconnaissance
 Reconnaissance can be described as the pre-attack phase and is a systematic attempt to locate, gather, identify,
and record information about the target. The Hacker seeks to find out as much information as possible about the
target.

Phase II: Scanning and Enumeration
 Scanning and enumeration is considered the second pre-attack phase. This phase involves taking the information
discovered during reconnaissance and using it to examine the network. Scanning involves steps such as intelligent
system port scanning which is used to determine open ports and vulnerable services. In this stage the attacker
can use different automated tools to discover system vulnerabilities.

Phase III: Gaining Access
 This is the phase where the real hacking takes place. Vulnerabilities discovered during the reconnaissance and
scanning phase are now exploited to gain access. The method of connection the Hacker uses for an exploit can be
a local area network, local access to a PC, the Internet, or offline. Gaining access is known in the Hacker world as
owning the system. During a real security breach it would be this stage where the Hacker can utilize simple
techniques to cause irreparable damage to the target system.

Phase IV: Maintaining Access and Placing Backdoors
 Once a Hacker has gained access, they want to keep that access for future exploitation and attacks. Sometimes,
Hackers harden the system from other Hackers or security personnel by securing their exclusive access with
Backdoors, Root kits, and Trojans.
 The attacker can use automated scripts and automated tools for hiding attack evidence and also to create
backdoors for further attack.

Phase V: Clearing Tracks
 In this phase, once Hackers have been able to gain and maintain access, they cover their tracks to avoid detection
by security personnel, to continue to use the owned system, to remove evidence of hacking, or to avoid legal
action. At present, many successful security breaches are made but never detected. This includes cases where
firewalls and vigilant log checking were in place.

The goal of this app is to introduce to people the true philosophy and ethics of the elusive world of Hacking, Hopefully clearing their name and giving them the social status they deserve. I will show you everything there is to show in hacking. Every single hacking technique that exists and how it works and how to actually carry them out yourself. You will also get to know how to protect yourself from these same hacks and eventually i hope to clear the bad name that has been given to Hackers around the globe.

YOUR JOURNEY BEGINS RIGHT HERE RIGHT NOW YOUNG PADAWAN :)
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
                Text("Basics of Ethical Hacking",
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
