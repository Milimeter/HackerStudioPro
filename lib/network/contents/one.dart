import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';

class NetworkFirst extends StatefulWidget {
  @override
  _NetworkFirstState createState() => _NetworkFirstState();
}

class _NetworkFirstState extends State<NetworkFirst> {
  var text = '''
  WHAT PROCESSES ARE INVOLVED WITH NETWORK PENETRATION TESTING?

There are a variety of methodologies used when it comes to effective penetration testing.  Some or all of these methodologies may be used depending upon the network system type.

BLACK BOX.

A penetration test that is black box is conducted without knowledge of any information related to the technical aspects of a network.  This type of test requires penetration testers to conduct comprehensive network exploration in an effort to determine the best way to organise a simulated attack.

Black box penetration testing is a simulation of a more realistic exploit on a network.  This method is used by businesses that want to stay on top of what hackers are capable of doing within a very short period of time.

WHITE BOX. 

White Box penetration testing occurs when network professionals have gathered all data and information associated with a network and its architecture.  This type of pen test is more like an audit and provides a comprehensive approach to security testing.  This form of pen testing is used by businesses that want to ensure every single aspect of their network is as secure as possible.

GREY BOX.

The Grey Box approach to penetration testing is performed according to internal information for a network including technical documents, user privilege credentials, and more.  Based on the internal information collected, a highly sophisticated network attack can be launched to determine what can happen when hackers gain access to sensitive information. Grey Box pen tests are a common approach that provides detailed security testing that takes place over a shorter period of time than the more involved process of White Box pen tests.

These are the main methodologies used in penetration testing. Other network monitoring tests such as intrusion detection, packet sniffing, and other methods are also often deployed to determine the status of network security.
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
                        MaterialPageRoute(builder: (context) => NetworkMain())),
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
                Text("Network Penetration Testing", 
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
