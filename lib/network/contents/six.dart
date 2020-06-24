import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';
class NetworkSix extends StatefulWidget {
  @override
  _NetworkSixState createState() => _NetworkSixState();
}

class _NetworkSixState extends State<NetworkSix> {
  var text = '''
  There are many tools out there for Wi-Fi hacking, but few are as integrated and well-rounded as Bettercap. Thanks to an impressively simple interface that works even over SSH, it's easy to access many of the most powerful Wi-Fi attacks available from anywhere. To capture handshakes from both attended and unattended Wi-Fi networks, we'll use two of Bettercap's modules to help us search for weak Wi-Fi passwords.

Bettercap allows access to the tools needed to swiftly scout for targets, designate one, and grab a WPA handshake to brute-force. While we won't be working with any WPS recon modules today, our setup will allow you to audit for weak WPA passwords with ease. The way Bettercap is organized allows for anyone within proximity of a target to probe for weak WPA passwords while staying stealthy and undetected.

Our targets, in this case, will be two kinds of networks: attended and unattended. Attended networks are easier to attack, and a larger number of tools will work against them. With an attended network, there are people actively using it to download files, watch Netflix, or browse the internet. We can count on there being devices to kick off the network that will give us the information we need to try to crack the password.

Unattended networks are trickier to target. Because they do not have devices with an active data connection on them to disconnect, these networks were typically unable to yield the information needed to audit for a weak password. With the PMKID approach to cracking WPA passwords, that's no longer the case. The tool is integrated as one of the Wi-Fi hacking modules and makes it even easier to attack.

Brute-Forcing Power Workarounds

Bettercap doesn't directly break the passwords of networks it targets, but it would be impossible to do so without the information Bettercap provides. Once a handshake is captured, you'll need to use a brute-forcing tool like Hydra or Aircrack-ng to try a list of common passwords against the hash you've captured. How quickly it will happen depends on a few factors.

The first is whether the password used to secure the target network is in the password list you're using at all. If it isn't, this attack won't succeed, so it's essential to use lists of real stolen passwords or customized password generators like CUPP. If you don't believe that brute-force attacks are still effective, you'd be surprised to learn that any eight-character password can be brute-forced in a little over two hours(Yeah freaking two hours).

Another workaround to using a device like a Raspberry Pi for Wi-Fi hacking is to upload the WPA handshake to a cracking service or network. Many hackers use networks that distribute the cracking load among volunteer "worker" computers, which lets the group crack WPA handshakes that less powerful devices can gather.

If you were to run Bettercap on a Raspberry Pi and then upload the captured handshakes to a distributed WPA cracker, you would be able to crack passwords within mere minutes. Alternatively, you could set this up yourself if you have a computer with a powerful processor and GPU.

What You'll Need

To follow this tutorial, you'll need a wireless network card you can put into wireless monitor mode. You can find a list of these in our previous articles on buying Wi-Fi network adapters. Your computer may have an internal card that supports wireless monitor mode, but you'll need to be running Linux to work with it. 

If you're running Kali, you can run 'apt install bettercap' to add it,
  ''';
  var text1 = '''
  Here, we can see the arguments we can start Bettercap with. One of the most useful of these is -iface which allows us to define which interface to work with. If we have an external wireless network adapter, we'll need to define it with that.

Take the adapter that's monitor mode-compatible, and switch it to monitor mode by opening a terminal window and typing airmon-ng start wlan1, with wlan1 substituted with the name of your network adapter.

After making sure that your wireless card is in monitor mode, you can start Bettercap by typing sudo bettercap --iface wlan1mon in a new terminal window, substituting the "wlan1" portion with your card's name.

Once Bettercap opens, type help to see a list of all the modules running and commands. In the modules, you can see that the Wi-Fi module is not started by default.

Scan for Nearby Networks

To get started, let's look at the commands we can issue under the Wi-Fi module. We can see this information by typing 'help wifi' into Bettercap.

Here, we can see lots of options! For our purposes, we'll be selecting the Wi-Fi recon module. To start it, type 'wifi.recon on' into Bettercap. You'll begin to get a flood of messages as soon as networks start to be detected. If this gets overwhelming, you can type events.stream off to mute the alerts.

Identify Targets

To see the networks that have been detected, type 'wifi.show' to display a list of networks.

You'll notice that all of the networks will be in green (you can't see it in this article, but on yours, you will see green). When we see a network is red (again, not in the box above but you will see it on your end), it means we have a handshake for it and can attempt to brute-force it. Let's start with a tried-and-true method first, and use the deauth module to try to get handshakes.

Attack with a Deauth Attack

To start the deauth module, you'll type wifi.deauth and then the MAC address of the network you want to attack. If you want to attack every network you've found, you can just type all or *, but be aware this can be illegal if you're interfering with someone's Wi-Fi that did not permit you to test this tool on it.

	wifi.deauth MAC
	wifi.deauth all

After allowing the tool to run for a minute or so, we can see the results by typing 'wifi.show' and seeing if any results have come in red. In our example, we can see that we've managed to grab handshakes for three of the nearby Wi-Fi networks we've detected.

This is a good result, but many of these networks are not attended, as can be seen by the client count section. Notice how this method didn't work against any network that didn't have clients attached? To attack these unattended networks, we'll need to run the second module. To save any handshakes captured, use set wifi.handshake followed by the directory you want to save the file in.

	wlan1  » set wifi.handshakes '/desiredfolderlocation'


I am sorry for not showing images as a reference to what i am say. The reason is because the output has a lot of revealing information about the devices i am trying to hack (and there is a chance i may or may not have the authority to do it on the network :) if you know what i mean).

I hope you enjoyed this guide to using Betterecap to hack Wi-Fi networks!. Have fun and happy breaking
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
                Text("Hack Wi-Fi Networks with Bettercap",
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
                        Container(child: Image.asset('assets/images/bet.png')),
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
