import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';

class BasicsFour extends StatefulWidget {
  @override
  _BasicsFourState createState() => _BasicsFourState();
}

class _BasicsFourState extends State<BasicsFour> {
  var text = '''
 Social engineering is one of the easiest techniques that can be used for gaining access to an organization or individual computer; yet it can be one of the most challenging if you do not do your homework on your target and victims. A good social engineer expert will spend time crafting his or her pretext (attack vector) and formulate a believable fantasy that has every detail accounted for. This attack has to be believable enough that no negative perceptions are created on the recipients end and that no alarms are raised during the process of making the fantasy a reality.

The social-engineer toolkit (SET) is a tool that helps automate some insanely complex techniques and make your attacks believable. A tool isjust that, a tool. Think of SET as a sword. The sword is only as good as the swordsman’s skill and understanding of how to use the sword. Understanding how to customize and use the SET to its fullest capacity will make your success ratios on social-engineering attacks extremely successful. 

So what is SET? SET is an exploitation framework purely dedicated to social engineering. It allows you to rapidly create a number of advanced attack vectors without the need of a significant programming background or years of maturity. SET has become the standard for penetration testers, and a method for attacking organizations and identifying how well they can withstand a targeted attack through social-engineering methods.

SET is no different in Kali and installs in the /usr/share/setoolkit directory and can be started anywhere from the command line by issuing the following command:

		se-toolkit
  ''';
  var text1= '''
  SET is a menu-driven system that allows you to customize your attack to the target you are using. Note that you can also edit the config file under /usr/share/setoolkit/config/set_config which will also allow you to expand how SET performs to your liking. Once inside the menu system, you have the ability to update Metasploit or SET with option 5 and 6. Option 1 places you into the social-engineering attacks, and option 2 places you into direct exploitation tools through the Fast-Track menu. We will be focusing on option 1, which is primarily where the social-engineering attacks are located. If you are following along, hit number 1 to bring us into the social-engineering attacks as shown below
  ''';
  var text2= '''
  Once inside, the menus give you the available options for the social-engineering attacks. Let us do a quick breakdown of the attack vectors. Because we are covering the basics we will not be diving into each one, but an understanding may help you down the road. The spear phishing attacks are specially crafted e-mails with malicious attachments. This may seem like what you hear about all the time in the news, but these attack vectors can be very difficult to pull off. For example, the majority of exploits that comes out for Adobe, Office, and others are usually quickly patched and are almost instantly detected by antivirus when first released.

As an attacker, and especially going into an organization as a penetration tester, you will typically only have one shot to pull off your attack. Exploits themselves are extremely specific on versioning.

	WEBSITE ATTACK VECTORS
One of SET’s flagship attack vectors is the website attack vectors. The attacks built into this group are highly successful and take advantage of believability (our friend in social engineering (SE)). When navigating SET, you will find the menu shown in Figure below if you select option 2 from the social-engineering attacks.

The two main attacks we will be focusing on are the Java applet attack method and the credential harvester. The Java applet attack is an attack that does not take advantage of the latest sexy exploit, but takes advantage of how Java was designed. With Java, there are full fledged applications called applets. These applets are written in Java and are often used in production applications all around the world. 

For example, Cisco’s WebEx utilizes Java applets in order to launch online web conferencing. Applets are extremely common in web applications and something that is highly believable under the right pretext. Select number one, then number two for the site cloner. SET will automatically go out to a web page, clone it, rewrite it with a malicious Java applet, rewrite the web page to inject the applet, set up a web server, and create multiple payloads for you and all within a few minutes. Once you select the “site cloner”, select “no” for Network Address Translation (NAT) or port forwarding. This would be used only if you were behind a router and had port forwarding in place and needed to forward ports. Next, enter the Internet protocol (IP) address of your machine (the attacker) as shown below
  ''';
  var text3 = '''
 Next, we specify what page we want to clone, we will use https://www.trustedsec.com as our target. You should notice that it clones and
places you in a menu to select your payloads as shown in Figure below.
  ''';
  var text4 = '''
  You can select whatever you are most comfortable with. The SE toolkit interactive shell is built into the SET and a nice alternative to meterpreter although not as feature rich. My personal favorites are the PyInjector and MultiPyInjector attack vectors. Often times, antivirus flags on static binaries and most meterpreter payloads out of the box get picked up by Anti Virus (AV). In order to get around this, Dave Kennedy created PyInjector and MultiPyInjector which injects shellcode straight into memory without touching disk. This often confuses or evades antivirus completely and allows you to have a meterpreter shell without the worry of being detected. Select number 15, the PyInjector shellcode injection. Specify the default port [443]; this is simply what port will connect back to use (reverse shell).

Next, select 1 for the Windows meterpreter reverse TCP payload. When your screen is loading, it should look similar to the figure below
  ''';
  var text5 = '''
  SET works by having multiple methods for attacking the target once the Java applet has been accepted. The first is utilizing a Powershell injection technique first developed by Matthew Graeber (http://www.exploit-monday.com/2011/10/exploiting-powershells-features-not.html) which allows you to utilize Powershell to inject shellcode straight into memory without ever touching disk. In addition to this technique, SET also uses a Powershell Execution Restriction Bypass attack that was originally released at Defcon 18 (http://www.youtube.com/watch?v1⁄4JKlVONfD53w) by David Kennedy (ReL1K) and Josh Kelley(winfang). These two attacks combined deliver a crippling blow in gaining remote code execution on a system. The second method is the PyInjector that you specified previously. Once SET is finished loading, it will launch Metasploit automatically. You should see something similar to Figure below
  ''';
  var text6 = '''
  Next, use the Windows target machine and browse to the malicious cloned website (residing on our Kali machine) by entering the IP address of the attacker machine into the uniform resource locator (URL) of the target machine’s browser. You should see something that looks similar to Figure above. After clicking “I accept”, then “run” you can switch back to your Kali machine. At this point, you should notice multiple meterpreter shells as shown in Figure below.

Once the victim clicks run, they are redirected back to the original website and never knew anything happened. In addition, if a user decides to hit cancel, the applet will reappear and not allow them to close their browser. The only way around it is to go to task manager and kill the browser or hit run. This attack is extremely effective and circumvents most of the current antivirus products in existence today. In addition, new obfuscated and encrypted payloads are automatically generated and uploaded to SET every 2 h. Always ensure you are running the latest version of SET.
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
                Text("Social Engineering",
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
                        Container(child: Image.asset('assets/images/se1.jpg')),
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se2.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se3.jpg')),
                        SizedBox(height:10),
                        Container(child: Image.asset('assets/images/se4.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se5.jpg')),
                        Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se6.jpg')),
                        Text(
                          text5,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se7.jpg')),
                        Text(
                          text6,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/se8.jpg')),
                        SizedBox(height:20),
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
