import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyThirteen extends StatefulWidget {
  @override
  _BountyThirteenState createState() => _BountyThirteenState();
}

class _BountyThirteenState extends State<BountyThirteen> {
  var text = '''
  Hey guys welcome to this section of the tutorial.

Now we are going to learn about how to exploit a file upload vulnerability. Now to exploit that vulnerability i am going to use BWAPP to explain how it is done. i have decided to set up BWAPP in my localhost apache server and that is where the exploitation is going to take place. So without any further delay, lets start.

Firstly i will go to uploading stage on the BWAPP page and upload a file that will give us our reverse shell to msfconsole server(yeah meterpreter). so again let us start 
 
Step 1: I will create the malicious file that i want to upload with msfvenom(which is a php file). Setting my lhost as 127.0.0.1 and lport as 4444 then i will save the file as payload.php .

  ''';
  var text2 = '''
  Step 2: After creating the payload i will head over to the BWAPP upload page, create the reverse listener on metasploit and upload the file
  ''';
  var text4 = '''
  Step 3: After uploading the file and setting up meterpreter. I will access the file i have uploaded then it will the trigger the reverse shell and BOOOOOOOM we are in on their server.
  ''';
  var text5 = '''
  Now that you have a shell on your target website, don't be too loud and  perform some priviledge escalation.

  Well thank you for this session. This marks the end of the tutorial is the 'HackerStudio Lite'. There are a lot more exploitation tutorials in the pro version of this app. Please try to get it to follow through. Peace
  ''';
  var text6 = '''
  
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
                Text("File Upload Vulnerability",
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
                       Container(child: Image.asset('assets/images/up.png')),
                       Container(child: Image.asset('assets/images/up1.png')),
                        
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/up2.png')),
                       Container(child: Image.asset('assets/images/up3.png')),
                       Container(child: Image.asset('assets/images/up4.png')),
                       Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/up5.png')),
                       Container(child: Image.asset('assets/images/up6.png')),
                       Container(child: Image.asset('assets/images/up7.png')),
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
