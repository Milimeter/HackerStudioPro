import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';
class NetworkThird extends StatefulWidget {
  @override
  _NetworkThirdState createState() => _NetworkThirdState();
}

class _NetworkThirdState extends State<NetworkThird> {
  var text = '''
  Hey guys welcome to this chapter

It is so easy to be a scrip kiddie in network penetration testing because if you don't understand how  networking works you would get lost and would always seek out automated tools to perform your hacks. You need to understand what tcp, icmp, snmp, ssh, telnet, ftp, vnc, rdp,and how all those other services work to be able to exploit them because if you don't know how they work then you won't understand how to exploit vulnerabilities in them on a technical level. 

Well the scope of this app is not to teach basic networking but so i'm just going to put out a list of services to look out for with their specific port numbers.
 1. FTP => PORT 20/21
 2. SSH => PORT 22
 3. TELNET => PORT 23
 4. SMTP => PORT 25
 5. HTTP => PORT 80
 6. HTTPS => PORT 443

This are the basic ports to look out for when pentesting a network like if your victim has an ssh server running and if your victim does, then what version is the server. After figuring out what version the server is on then scan or search for it vulnerability that is exploitable.


Well without further delay let's get started with other parts of network infiltration. But make sure you understand a thing or two about networking because you might not be able to understand what the other chapters may contain.
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
                Text("Networking",
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
