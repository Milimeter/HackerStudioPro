import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';

class NetworkTwo extends StatefulWidget {
  @override
  _NetworkTwoState createState() => _NetworkTwoState();
}

class _NetworkTwoState extends State<NetworkTwo> {
  var text = '''
  	Break into Router Gateways with Patator 

Router gateways are responsible for protecting every aspect of a network's configuration. With unfettered access to these privileged configurations, an attacker on a compromised Wi-Fi network can perform a wide variety of advanced attacks.

	Brute-Forcing Router Logins with Patator

After hacking a Wi-Fi router with tools like Aircrack, Wifiphisher, and Wifite2, there are several avenues an attacker may explore to further compromise the network. Assuming the gateway isn't using default credentials, the attacker will try to exploit a vulnerability in the router or perform a brute-force attack.

With access to the router's gateway and complete control over the configurations, a hacker in this position of power can perform a variety of attacks. They could do any of the following, and then some.

  1.perform DNS poisoning attacks
  2.modify or manipulate forwarding ports
  3.reset the gateway password
  4.inject JavaScript into a browser on the network
  5.reset the Wi-Fi name and password
  6.install a malicious firmware
  7.modify or delete login and system logs
  8.modify or disable the firewall

Patator, like Hydra and Medusa, is a command-line brute-forcing tool. The developers have tried to make it more reliable and flexible than its predecessors. My favorite feature of Patator is the raw_request module that allows penetration testers to brute-force HTTP logins much like Burp's Intruder module.

Now, a word of caution: Patator isn't very beginner-friendly, so there's a bit of a learning curve with the syntax that can take some getting used to. Before proceeding, you should have a general understanding of HTTP requests, HTTP status codes, and some experience with Burp's Intruder module.

Install Patator in Kali Linux

Use the following apt-get command to install Patator in Kali.

As stated, we'll focus on the http_fuzz module, designed to brute-force HTTP logins as well as perform various types of web-based injection attacks (e.g., fuzzing). View the available http_fuzz options using the following command.

  ''';
  var text1 = '''
  Attacking the Medialink AC1200 Router

The first router being attacked is the Medialink AC1200. It's currently one of Amazon's top choices for consumer router's and quite popular.
Step 1Capture a Login Request with Burp

After configuring Firefox with Burp Suite's Proxy module, navigate to the AC1200's gateway at http://192.168.8.1/login.html.

Type "password" into the password field and press Enter. Burp will intercept the login and display the below request.

Identify the Parameters

Notice the password= parameter isn't "password" as expected, but instead the scrambled "5f4dcc3b5aa765d61d8327deb882cf99" string.

Those familiar with password hashing may recognize the hash as the MD5 for "password." It can be verified using the below command which prints the desired string into the md5sum command.
  ''';
  var text2 = '''
  That tells us that the wordlist used when brute-forcing the gateway must be in MD5 format. With this particular router, at the gateway, there's no available field for username input. We can see from the captured data that the "admin" username is embedded into the request. So there's only one dynamic parameter: the password.

Modify & Save the Raw Request

Change the hashed password parameter to "FILE0" within the request. The modification will act as a placeholder in the request that indicates to Patator where to insert the passwords. (The reason for this will be clear in a later step.)

When that's done, right-click inside the Burp window and select the "Copy to file" option. Save it to the /tmp directory with the "router_request.txt" filename.
   ''';
  var text3 = '''
  Generate a Targeted Wordlist

As we discovered previously, passwords are hashed in the browser before being sent to the router. Patator has a built-in feature to hash passwords, but let's take this opportunity to learn some Bash password manipulation tricks.

First, download a preferred wordlist. Any generic wordlist will do fine for testing purposes. Use the below wget command to download my wordlist generated by analyzing leaked databases.

The below Bash one-liner will use a while loop to iterate through the passwords in the wordlist. Each password will be converted into an MD5 and appended to the md5_wordlist.txt file.

The new md5_wordlist.txt file can be viewed using the below head command, to print the first ten lines.

  ''';
  var text4 = '''
  Identify & Filter Failed Requests

With the router_request.txt and the wordlist of hashed passwords, the router's gateway can be brute-forced with the following Patator command. To stop the brute-force attack at any time, press Control+ c on the keyboard.


To break that command down:

    raw_request= — Use the router_request.txt created in an earlier step to generate login attempts against the router's gateway.
    accept_cookie= — Save received cookies to issue them in future requests.
    follow= — Follow Location redirects (e.g., status code 302), for both failed and successful login attempts if instructed by the server.
    0= — The "FILE0" placeholder in the router_request.txt will iterate through the provided list of passwords.
    -l — Save output data into the provided directory. All of Patator's responses will be stored in an organized fashion.

After running the command, my output looks like this:
  ''';
  var text5 = '''
  Hypertext Transfer Protocol (HTTP) status codes, also known as response codes, are issued by web servers to our web browser when we make requests. These codes are a way for web servers to communicate errors to syadmins, web developers, and end-users alike.

Sometimes the 200 ("200 OK") status code is an indication that the server accepted the provided password. In this case, every single login attempt is producing the "200 OK" response — so it's actually helping to identify what a failed login attempt looks like.

The "size" column can also be extremely helpful. It will display the size (in bytes) of the server's response to the login attempt. It's returning 20 bytes with every login attempt, so it's probably safe to assume this byte size indicates a failed login attempt, in which case, it's safe to omit responses of that size. We can do so by adding the -x ignore:size=20 option and argument.

Now, only one request is displayed, with a size of 3,962 bytes.

There are a few ways of unhashing a discovered password. The passwords in both wordlist.txt and md5_wordlist.txt appear in the same order. The only difference is that one wordlist is in plain text; the other is hashed.

Below, we'll use nl to prepend a number to every line in the md5_wordlist.txt, then grep for the hash.

The hash appears on line 291 of the md5_wordlist.txt file. Now, use nl on the plain text wordlist, and grep to find the line number.

The password is "yellow." It can be further verified using the following command.
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
                Text("Breaking into Router Gateway",
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
                        Container(child: Image.asset('assets/images/g.png')),
                        Container(child: Image.asset('assets/images/g1.png')),
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/g2.jpg')),
                        Container(child: Image.asset('assets/images/g3.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/g4.jpg')),
                        Container(child: Image.asset('assets/images/g5.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/g6.png')),
                        Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/g7.png')),
                        Text(
                          text5,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/g8.png')),
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