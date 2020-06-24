import 'package:flutter/material.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';

class TricksNine extends StatefulWidget {
  @override
  _TricksNineState createState() => _TricksNineState();
}

class _TricksNineState extends State<TricksNine> {
  var text = '''
  How to Spear Phish with the Social Engineering Toolkit (SET) in Kali Linux

Social engineering is the act of getting people to give you the information you seek, usually by gaining their trust. That trust may be gained by posing as someone in authority, a colleague, or just someone who needs help. Some of the best hackers in history, including Kevin Mitnick, have been great social engineers.

STEP 1: Open SET

To start using the Social Engineering Toolkit, go to BackTrack, then Exploitation Tools, then Social Engineering Tools, then Social Engineering Toolkit, and click on set.


  ''';

  var text1 = '''
  STEP 2: Pick Your Type

This should open the main menu for the Social Engineering Toolkit. Note that it offers:

    Spear-Phishing Attacks
    Website Attacks
    Infectious Media Generator
    Create a Payload and Listener
    Mass Mailer Attack
    Arduino-based Vector Attack
    SMS Spoofing Attack
    Wireless Access Point
    And many others

In this tutorial, we'll be looking at creating a spear-phishing attack. For those of you not familiar with this terminology, a phishing attack is an email attack with a broad "net" in an attempt to try to pick up a few random victims. A spear-phishing attack is similar, except that it targets one or a few individuals. In other words, it's a targeted social engineering attack, hence the spear.

  ''';

  var text2 = '''
  Spear-Phish

Let's now select number 1 from the menu and begin our spear-phishing attack. When we do, we will be greeted with the screen below.

It explains what a spear-phishing attack is and asks us how we want to go about our attack. We can choose:

    Mass email attack
    FileFormat payload
    Social engineering template

Let's select a FileFormat attack. Type number 2 and press enter.

  ''';

  var text3 = '''
  STEP 4: Choose an Attack

After we select our FileFormat type attack, we will be asked what type of exploit we would like to use. Notice that the default is the PDF with the embedded .exe. In this hack, let's use the Microsoft Word RTF Fragments attack or MS10_087.
  ''';
  var text4 = '''
  This will create a Word document that will overflow a buffer and enable us to put a listener or rootkit on the victim's machine. Type 4 and press enter.

STEP 5: Choose a Payload

Now that we have decided what type of file we want to use in our attack, our next step is to decide what type of listener (aka rootkit, aka payload) we want to leave on the victim system. These may look familiar to those of you who have used Metasploit as these are Metasploit payloads.

Let's be ambitious and try to get the Metasploit meterpreter on that victim's machine. If we are successful, we will completely own that system!
  ''';
  var text5 = '''
  STEP 6: Create the File

After we type number 5 and press enter, we must choose what port we want to listen on (the default 443). SET then goes about creating our malicious file for us. It names that file template.rtf.
  ''';
  var text6 = '''
  STEP 7: Rename the File

If we want to trick the victim into opening the file, we should name it something that sounds enticing or familiar to the victim. Now this will differ depending upon the victim, but in our scenario we're trying to spear a manager at a large company, so let's call it SalesReport, something he or she might actually be expecting in their email.
  ''';
  var text7 = '''
  STEP 8: Create the Email

Now that we have created the malicious file, we now need to create the email. This is important. If we're to get the victim to open the file, the email must look legitimate. SET prompts us whether we want to use a pre-defined template or a one-time-use email template. Let's be creative and choose a one-time-use email.

SET then prompts us for the subject of the email. In this case, I used Sales Report. SET then asks us whether we want to send it in html or plain text. I chose html to make it look more inviting and legitimate. Finally, SET prompts us to write the body of the email and then type Control + C when we are finished. I wrote:

Dear BigShot:

Please find attached my quarterly sales report. If you have any questions, please feel free to ask.

Sincerely,

Your Minion

Of course, your email will differ depending upon who you're sending it to, but try to make it sound enticing and legitimate or they aren't likely to open the attached malicious file and our attack will fail.
  ''';
  var text8 = '''
  Dear BigShot:

Please find attached my quarterly sales report. If you have any questions, please feel free to ask.

Sincerely,

Your Minion

Of course, your email will differ depending upon who you're sending it to, but try to make it sound enticing and legitimate or they aren't likely to open the attached malicious file and our attack will fail.

When we're finished, SET will ask us whether we want to use a Gmail account or send it from our SMTP server. In most cases, we will want to use a Gmail account. Simply type in your address (you might want to create an anonymous email account for this purpose) and password, and SET will send the email you created with the malicious attachment from this Gmail account.
  ''';
  var text9 = '''
  
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
                Text("How to Spear Phish",
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
                        Container(child: Image.asset('assets/images/set.jpg')),
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set1.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set2.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set3.jpg')),

                        Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set4.jpg')),

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
                        Container(child: Image.asset('assets/images/set5.jpg')),
                        Text(
                          text7,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set6.jpg')),
                        Text(
                          text8,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/set7.jpg')),
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
