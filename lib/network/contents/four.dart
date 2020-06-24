import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';

class NetworkFour extends StatefulWidget {
  @override
  _NetworkFourState createState() => _NetworkFourState();
}

class _NetworkFourState extends State<NetworkFour> {
  var text = '''
  There are a lot of ways to perform a DOS attack on a wireless router that is accessible to us but one of the way that i am going to show is with the use of a tool known as 'aircrack-ng' package. This package include a lot of different tool that can be used to perform attacks on a wireless network so without any further delay lets get started.

Now based on my hacking methodology i always like going against a target this principle known as ' identify the target and it flaw then build malware and attack'. I don't think i have to explain what that means because it is pretty straight forward so...

STEP 1: Put your wireless card into monitor mode( By default your wireless card is in promiscious mode). Of course after you have installed aircrack-ng package from your terminal.
	sudo apt-get install aircrack-ng

Then put your wireless card into monitor mode by typing on your terminal:
	sudo airmon-ng start wlan0

Note: wlan0 being your wireless card name(you can figure this out by typing 'ifconfig' on your terminal)
  ''';
  var text1 = '''
  STEP 2: Scan your area for wireless signals with airdump-ng(yeah it comes with aircrack-ng package) by entering the command in your terminal:
	sudo airodump-ng wlan0mon

Note: After puting your network card into wireless mode your wireless interface name will change from wlan0 to wlan0mon
  ''';
  var text2 = '''
  STEP 3: Now after identifying the MAC address of the router or network you want to DOS. Then you launch aireplay-ng(it comes with aircrack-ng package too) by typing the command on your terminal:
	sudo aireplay-ng -0 0 -a (MAC) wlan0mon
  ''';
  var text3 = '''
  Now that you know how to DOS a network. what if you want to DOS a single client on a network then you would type the following into your terminal.

	sudo aireplay-ng -0 0 -a (MAC) -c (Client MAC) wlan0mon

Note: Doing this on an unauthorized network is highly illegal. Have fun and happy breaking

  ''';
  var text4 = '''
  
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
                Text("Deauthing WiFi Signals",
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
                        Container(child: Image.asset('assets/images/dos.png')),
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/dos1.png')),
                        
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/dos2.png')),
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
