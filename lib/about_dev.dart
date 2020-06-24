import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var aboutMe = ''' 
  My name is Oladapo Abdulrazaq but my friends calls me Millimeter and i am a Mechatronics Engineering Student :). 
  
  To the outside world I am just an ordinary Flutter CrossPlatform Application Developer but secretly with the help of my HP computer, i fight bugs on BugBounty programs, practise Ethical hacking and i create awesome tutorial contents for the hacking community
  
  When i was a child i didn't have many resources to learn about Ethical Hacking so i decided to create a CrossPlatform Application to help others to learn awesome things on hacking.
  
  And i'll continue to be a better version of myself.
  
  I am the MILLIMETER
  ''';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          // Here the height of the container is 45% of our total height
          height: size.height * .50,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          height: 250,
                          width: 352,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2BEA1),
                          ),
                          child: Image.asset("assets/images/e.png"),
                        ),
                      ),
                Text(
                  "About Developer",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                
                Expanded(
                 child: ListView(
                                    children: [Container(
                     margin: EdgeInsets.only(top:20),
                     child: Text(
                aboutMe,
                textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16, color: Colors.grey, )
                ),
                   ),]
                 ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}