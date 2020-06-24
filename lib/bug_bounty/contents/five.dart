import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyFive extends StatefulWidget {
  @override
  _BountyFiveState createState() => _BountyFiveState();
}

class _BountyFiveState extends State<BountyFive> {
  var text = '''
   ZED ATTACK PROXY: BRINGING IT ALL TOGETHER UNDER ONE ROOF
We have discussed several frameworks to assist with your web hacking, however before closing the chapter, let us examine one more. In this
 section, we are going to cover the ZAP from the OWASP because it is a full-featured web hacking toolkit that provides the three main pieces of functionality that we discussed at the beginning of this chapter: intercepting proxy, spidering, and vulnerability scanning. ZAP is 100% free and preinstalled in Kali. You can open ZAP in the Kali menu by clicking on the all Applications / Kali Linux / Web Applications zaproxy. You can also start ZAP by typing the following on the command line:

zap

Before using ZAP, you will need to configure your browser to use a proxy. Please note you will need to enter a port number of 8080 rather than 8008 as shown below
   ''';
   var text1 = '''
   After configuring the proxy settings in your browser and starting ZAP, as you browse web pages using Iceweasel, the ZAP “Sites” tab will keep a running history of the URL you visit. You can expand each URL to show additional directories and pages that you have either visited directly or have been scraped by ZAP. Figure 6.14 shows we have visited www.dsu.edu, www.espn.com, and www.google.com and a couple of others.

SPIDERING IN ZAP
One of the most beneficial aspects of finding all available pages by spidering is that we will have a larger attack surface to explore. The larger our attack surface is, the more likely an automated web vulnerability scanner can locate an exploitable issue. Spidering in ZAP is very easy. It begins by finding the URL, or a specific directory within that URL, that you would like to spider. This is a good time to remind you that you should not spider a website that you do not own or do not have authorization to perform spidering on. Once you have identified your targeted URL or directory in the “Sites” tab, you can simply right-click on it to bring up the “Attack” ZAP menu as shown in Figure below
   ''';
   var text2 = '''
   SCANNING IN ZAP
Once the spider has completed its work, the next step is to have the vulnerability scanner in ZAP further probe the selected website for known vulnerabilities. A web scanner is very similar to Nessus that is loaded with signatures of known vulner- abilities, so the scanner results are only as good as the signatures that it includes. By selecting “Active Scan site” in the “Attack” menu, ZAP will send hundreds of requests to the selected website. As the website sends back responses, ZAP will analyze them for signs of vulnerabilities. This is an important aspect of web scanning to understand: the scanner is not trying to exploit the website, but rather send hundreds of proof-of -concept malicious requests to the website and then analyze these responses for signs of vulnerability. Once an exact page is identified to be plagued by an exact vulnerability (SQL injection on a login page, for example), you can then use the intercepting proxy to craft a malicious request to that exact page with the exact malicious variable values in order to complete the hack! ZAP also has passive scanning functionality, which does not send hundreds of proof-of-concept requests, but instead simply analyzes every response that your browser receives during normal browsing for the same vulnerabilities as active scanning. This means you can browse like you normally do and review the website for vulnerabilities without raising any suspicion from rapid requests like active scanning. All the scanning results will be housed in the “Alerts” tab for easy review. The full report of ZAP Scanner’s findings can be exported as HTML or Extensible Markup Language via the “Reports” menu.
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
                Text("Contents Discovery and Spidering",
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
                       Container(child: Image.asset('assets/images/zp.jpg')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/zps.jpg')),
                        Text(
                          text2,
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
