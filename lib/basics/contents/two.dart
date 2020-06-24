import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';

class BasicsSecond extends StatefulWidget {
  @override
  _BasicsSecondState createState() => _BasicsSecondState();
}

class _BasicsSecondState extends State<BasicsSecond> {
  var text = '''
    Script Kiddies
The most dangerous class of Hackers is Script kiddies, They are the new generation of users of computer who take advantage of the Hacker tools and documentation available for free on the Internet but don’t have any knowledge of what’s going on behind the scenes. They know just enough to cause you headaches but typically are very sloppy in their actions, leaving all sorts of digital fingerprints behind. Even though these guys are the teenage Hackers that you hear about in the news media, they need minimum skills to carry out their attacks.

Script Kiddies are the bunnies who use script and programs developed by others to attack computer systems and Networks. They get the least respect but are most annoying and dangerous and can cause big problems without actually knowing what they are doing.
    So how do you not become a scriptkiddie. Well the answer is simple, LEARN TO PROGRAM

  You might be asking yourself, do I even need to learn a programming language? The answer to that is both yes and no. It all depends on what your goals are. Nowadays, with all the point and click programs out there, you can be afairly good ethical hacker without knowing any programming. You can do someeffective hacking if you understand all of the security tools very well. Even if you understand what’s going on in the background of these programs, most people will still classify you as a script kiddie. Personally I think you should learn some programming. Even if it’s the very basics, it’ll give you a much better understanding of what’s going on. Also, once you learn how to program well, you’ll be able to develop your own exploits, which is great in many ways:

1. You’ll be considered an elite hacker.
2. Imagine a black hat discovers a vulnerability and codes an exploit for itthat no one else knows about. The black hat would be able to take down thousands of machines before anyone discovers and patches the vulnerability.
3. You will feel so much more satisfied having created your own program or exploit. I promise you this. So my advice is, don’t settle for being a point and click hacker. Take some time to understand even just the basics of programming and an entire new world of hacking will open up to you.
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
                Text("How to not be a ScriptKiddie",
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
