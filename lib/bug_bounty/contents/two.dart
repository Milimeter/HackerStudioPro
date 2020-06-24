import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';
 class BountyTwo extends StatefulWidget {
   @override
   _BountyTwoState createState() => _BountyTwoState();
 }
 
 class _BountyTwoState extends State<BountyTwo> {
   var text = '''
   Trained in Open Source Intelligence, you use your knowledge of where information exists on the
Internet to find as much information about your as you can.

We will start with Passive Discovery, which will search for information about the target, network, clients, and more without ever touching the targeted host. This is great because it uses resources on the Internet without ever alerting the target of any suspicious activity. You can also run all these lookups prior to an engagement to save you an immense amount of time. Let’s start reviewing some sources and tools for OSINT.

Discover Scripts
(https://github.com/leebaird/discover) (Kali Linux)

Discover scripts by Lee Baird is still one of my favorite passive discovery tools because of the ease of use and the amount of data gathered. Using a passive recon scan, Discover will use tools such as: dnsrecon, goofile, goog-mail, goohost, theharvester, metasploit, urlcrazy, whois, dnssy, ewhois, myipneighbors, and urlvoid. Discover is updated often and is a great tool for performing OSINT.
   ''';
   var text1 = '''
    ● cd /opt/discover
    ● ./discover.sh
○ 1. Domain
○ 1. Passive
○ [Company Name]
○ [Domain Name]
○ firefox /root/data/[Domain]/index.htm
The results include information about email addresses, names of employees, and hosts.

Some of the more interesting findings are those such as squatting and bitflipping. Discover shows us which squatting domains have been purchased and which are currently free. In an engagement, a doppelganger domain could prove extremely valuable for phishing, trust, or compromising victims.
   ''';
    var text2 = '''
   Active discovery is the process of trying to identify systems, services, and potential vulnerabilities. We are going to target the network ranges specified in scope and scan them. Whether you are scanning from the internal or the external segments of the network, it is important to have the right tools to perform active discovery.

Masscan
(https://github.com/robertdavidgraham/masscan) (Kali Linux)
Once you start active scanning, there are many tools to use. Historically, we have all used nmap to map out IPs/Ports, but the game has been changing. Large ranges are a pain to scan, but this is where Masscan comes into play. Similar to nmap (it even has similar flags), Masscan uses its own custom TCP/IP stack for speed and efficiency. Let’s see how we would kick off a Masscan scan.

	Running Masscan:

● cd /opt/masscan/bin/
● ./masscan -p80,8000-8100 10.0.0.0/8
● ./masscan -p0-65535 --rate 150000 -oL output.txt
○ -p defines the ports to be scanned
○ --rate defines packets-per-second
	■ Be careful with this setting. Make sure your VPS the servers or that the system/network from which you run Masscan can support the amount of traffic
○ -oL defines the list output to write to.
:/opt/masscan/bin\$./masscan -p0-65535 23.239.151.0/24 --rate 150000 -oL output.txt


Http Screenshot
(https://github.com/breenmachine/httpscreenshot)(Kali Linux)
One of the most efficient and effective starting points on a penetration test is understanding what systems and services are available. Although there are plenty of network/service level exploits, I have found most initial entry points into an organization, especially from the outside, to be via webapplications, because systems have default passwords, simple misconfigurations, or many known web application flaws.  That comes out to 65536 different IPs that we need to scan and start analyzing. Sure, we kick off our vulnerability scanner in the background, but we need to start attacking, as time is limited. Since there is no way we could visit each and every one of those web pages, we need to automate this process and be able to utilize the resulting data in an efficient manner.

This is where we combine both Masscan and HTTP Screenshot to scan the network and take screenshots of the webpages. This way, we can visually look at web pages instead of visiting them one by one. Before starting the scan, we need to configure a few settings:
● cd /opt/httpscreenshot
● edit masshttp.sh to make sure it points to the right masscan executable and make sure that httpscreenshot.py points to the correct location.


change the port to be scanned from 80,443 to 80,443,8000,8001,8080,8443,8008,9200,50070 [add your favorite web ports here]

● create a file called networks.txt to put in the network cidr range you want to scan
○ gedit networks.txt
Let’s kick off a scan:
	● ./masshttp.sh
	● firefox ./clusters.html

With the speed of Masscan and the power of HTTP Screenshot, we have a list of websites with the host images. There are a lot of benefits of HTTP Screenshot such as resolving certificate hostnames for virtual/shared hosting and threading, but the biggest benefit is how it correlates similar web pages together. You might have a ton of http basic auth pages or printers and HTTP Screenshot will correlate them together. It makes it much easier for attacking and reporting. I will say that the output isn’t the prettiest, but the functionality is what works.



   ''';
    var text3 = '''
   
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
                Text("Passive and Active Discovery",
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
                        Container(child: Image.asset('assets/images/discover.jpg')),

                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/discover_output.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/httpsc.jpg')),
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
