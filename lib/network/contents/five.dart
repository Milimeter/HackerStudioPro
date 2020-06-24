import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';


class NetworkFive extends StatefulWidget {
  @override
  _NetworkFiveState createState() => _NetworkFiveState();
}

class _NetworkFiveState extends State<NetworkFive> {
  var text = '''
  This chapter is about attacking home or officie wireless routers based on the vulnerabilities.

Well during most of my investigations and authorized intrusions into wireless routers, I have discoved many routers having a lot of serious vulnerabilities and which could lead to total take over(i mean you can own the router) of the router itself. Since routers are the major line of defense for any major network and if you can successfully break into them, you generally can do pretty much what ever you want on the network. If you even like you can take down or exclude people(clients) from the firewall settings which can be a painful experience for the admin or the organization that owns the router and of course also change the dns settings(which is juicy if you ask me). 

So let us get started on the attack but a note here is that do not do this if you do not have the authority to do this on a network you do not own.

There are many way of achieving our task but the way i will go through this is by using a manual way and an automated way. So once you are on a wifi network you have to know what you want to attack and what you how you are going to do it. As of this moment i do not have access on a wifi router so there will not be many images displaying the attack.

Step 1: Identify the router
	You can acheive this by running a simple nmap scan to figure out what the ip address of the router is or you could run the command 'route' on your terminal. So to run the nmap scan for finding the routers ip address, you need to run the command in your terminal:
	sudo nmap 192.168.0.0/24

This 192.168.0.0/24 being your subnet address. so on the output of the command you should see address like:
	192.168.0.1
which is common to most of the routers i have seen and dealt with(192.168.0.1 is your routers ip address). But i will advice you to go through the 'route' command. In the terminal type:
	route

then you will have the output in the following format:
Kernel IP routing table
Destination     Gateway         	Genmask         Flags Metric Ref    Use Iface
default         _gateway        	0.0.0.0         UG    600    0        0 wlan0
192.168.43.0    192.168.43.1      255.255.255.0   U     600    0        0 wlan0

under the gateway is the routers ip address which is '192.168.43.1' in this case.

STEP 2: After knowing the routers ip address then you would try to access it through the web by entering the ip address into the url space.

STEP 3: Look out for the model number of the router and search for the vulnerabilities related to it in this format:
	(Routers model) vulnerabilities


Have fun and happy breaking

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
                Text("Exploiting Wireless Routers 1",
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
