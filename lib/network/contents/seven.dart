import 'package:flutter/material.dart';
import 'package:hackerstudiopro/network/network_main.dart';

class NetworkSeven extends StatefulWidget {
  @override
  _NetworkSevenState createState() => _NetworkSevenState();
}

class _NetworkSevenState extends State<NetworkSeven> {
  var text = '''
  If you find yourself with a roommate hogging limited data bandwidth with video games or discover a neighbor has invited themselves into your Wi-Fi network, you can easily take back control of your internet access. Evil Limiter does this by letting you control the bit rate of any device on the same network as you, allowing you to slow or even stop data transfer speeds for them completely.

Generally speaking, the average user doesn't have much visibility over who or what is on their network, so anyone with the password can slip in and start using bandwidth. In other situations, a roommate or family member may be hogging all the bandwidth unfairly to play video games or stream videos. Some routers have web interfaces that allow you to set limits on each connection, but without the password to the router, this option may not be accessible.

Evil Limiter uses ARP spoofing to make devices send data to the attacking computer rather than the router, allowing us to send the data on to the router at whatever speed we like. Thanks to the way the ARP protocol works, it's possible to control the speed of any device on a shared network connection. However, because ARP spoofing only works on IPv4 networks, this tool won't be effective on IPv6 for now.

Evil Limiter for Hackers

For a hacker, Evil Limiter allows easy targeting of either one, a few, or all devices on a network. It's easy to cut the cord on the internet of a particular device at any moment, allowing for a convenient pretext for a social engineering attack. If a hacker wanted access to an employees-only area, they could identify the device of employees in the area they want to be, then limit the speed of their connection.

Rather than showing up unannounced, a hacker could throttle the manager's data connection while pretending to call from the utility company to ask if the internet connection has been slow. When the manager finds the internet is indeed slow, the hacker simply asks the best time to send someone over to fix it, giving them a pretext to enter the building and preventing the target calling the real utility company.

What You'll Need

To use Evil Limiter, you'll need a Linux system like Kali or Ubuntu with Python3 or higher. While a powerful advantage of Evil Limter is that it can be run on networks even when you don't have administrator privileges, I recommend making sure you have permission to run the tool on any network you want to test it on.

Evil Limiter uses the ARP packet to limit connection speeds which is present in IPv4 networks, but not in IPv6 networks. Because of this, IPv6 systems are out of reach of this tool, as mentioned before.

STEP 1: Install Evil Limiter

To install Evil Limiter, there are only a few commands to throw in a terminal window, seen below. When the required libraries finish installing, Evil Limiter should be installed and ready to run.
	~# git clone https://github.com/bitbrute/evillimiter.git
	~# cd evillimiter
	~# sudo python3 setup.py install

  ''';

  var text1 = '''
  STEP 2: Connect to the Network

Now, you'll need to connect to your target network. Afterward, you can run Evil Limiter by typing 'evillimiter' in a new terminal window. You should see something like below.
  ''';
  var text2 = '''
  If you see this, Evil Limiter is installed, connected to the network, and ready to go.
  STEP 3: View Available Commands

You can explore the functionality of Evil Limiter by looking through the menu system and checking out the available commands. To do so, type a question mark in the terminal to pull up the help page.
  ''';

  var text3 = '''
  STEP 4: Discover Devices

As we can see above, the commands are straightforward. To find devices on the network, all you need to do is type scan.

(Main) >>> scan

100% |██████████████████████████████| 256/256
OK   7 hosts discovered.

The scan will pull up any other hosts on the network. Type 'hosts' to show them all.

(Main) >>> hosts

┌Hosts──────────────┬───────────────────┬──────────┬────────┐
│ ID │ IP-Address   │ MAC-Address       │ Hostname │ Status │
├────┼──────────────┼───────────────────┼──────────┼────────┤
│ 0  │ 192.168.5.1  │ 84:██:██:██:██:1a │ _gateway │ Free   │
│ 1  │ 192.168.5.2  │ 0c:██:██:██:██:f5 │          │ Free   │
│ 2  │ 192.168.5.4  │ 3c:██:██:██:██:6f │          │ Free   │
│ 3  │ 192.168.5.24 │ 60:██:██:██:██:78 │          │ Free   │
│ 4  │ 192.168.5.25 │ c4:██:██:██:██:2b │          │ Free   │
│ 5  │ 192.168.5.61 │ 8c:██:██:██:██:f5 │          │ Free   │
│ 6  │ 192.168.5.67 │ f0:██:██:██:██:b5 │          │ Free   │
└────┴──────────────┴───────────────────┴──────────┴────────┘

In my example, seven devices have been discovered on the network, with one of them being the router. Now we have a target list with which we can block or limit access, so let's give it a try.

STEP 5: Limit or Block Devices

If you want to limit every device except the router, you can list them off one by one after the limit command. You'll also have to specify the speed you want to limit them to. In my case, I'll go with 200kbit as the limiting speed.

You could use the limit all command to choose everything, but because you want to leave the router alone, type the command limit 1,2,3,4,5,6 instead to begin limiting those specific devices. The amount of devices you list depends on how many you found.

(Main) >>> limit 1,2,3,4,5,6 200kbit

OK   192.168.5.2 limited to 200kbit.
OK   192.168.5.4 limited to 200kbit.
OK   192.168.5.24 limited to 200kbit.
OK   192.168.5.25 limited to 200kbit.
OK   192.168.5.61 limited to 200kbit.
OK   192.168.5.67 limited to 200kbit.

Now that we've limited some devices, we can also select any devices we want to block entirely from accessing the network. I've found that sometimes Evil Limiter can be heavy-handed while limiting connections, and the result is that devices are limited so much they might as well be blocked.

To block a device, type the block command, then the number of any device you want to prevent from receiving data over the network.

(Main) >>> block 3

OK   192.168.5.24 blocked.

Try hosts a second time. The majority of the network should be blocked or limited.

(Main) >>> hosts

┌Hosts──────────────┬───────────────────┬──────────┬─────────┐
│ ID │ IP-Address   │ MAC-Address       │ Hostname │ Status  │
├────┼──────────────┼───────────────────┼──────────┼─────────┤
│ 0  │ 192.168.5.1  │ 84:██:██:██:██:1a │ _gateway │ Free    │
│ 1  │ 192.168.5.2  │ 0c:██:██:██:██:f5 │          │ Limited │
│ 2  │ 192.168.5.4  │ 3c:██:██:██:██:6f │          │ Limited │
│ 3  │ 192.168.5.24 │ 60:██:██:██:██:78 │          │ Blocked │
│ 4  │ 192.168.5.25 │ c4:██:██:██:██:2b │          │ Limited │
│ 5  │ 192.168.5.61 │ 8c:██:██:██:██:f5 │          │ Limited │
│ 6  │ 192.168.5.67 │ f0:██:██:██:██:b5 │          │ Limited │
└────┴──────────────┴───────────────────┴──────────┴─────────┘

STEP 6: Restore Normal Connection

Now that you've caused chaos on the network, it's time to set things back the way they were. Fortunately, doing so is easy. You can choose to either restore devices one by one or run free all to undo any limitations on network devices.

(Main) >>> free all

OK   192.168.5.2 freed.
OK   192.168.5.4 freed.
OK   192.168.5.24 freed.
OK   192.168.5.25 freed.
OK   192.168.5.61 freed.
OK   192.168.5.67 freed.

Run 'hosts' a third time, and network access should be normal again for all devices.

(Main) >>> hosts

┌Hosts──────────────┬───────────────────┬──────────┬────────┐
│ ID │ IP-Address   │ MAC-Address       │ Hostname │ Status │
├────┼──────────────┼───────────────────┼──────────┼────────┤
│ 0  │ 192.168.5.1  │ 84:██:██:██:██:1a │ _gateway │ Free   │
│ 1  │ 192.168.5.2  │ 0c:██:██:██:██:f5 │          │ Free   │
│ 2  │ 192.168.5.4  │ 3c:██:██:██:██:6f │          │ Free   │
│ 3  │ 192.168.5.24 │ 60:██:██:██:██:78 │          │ Free   │
│ 4  │ 192.168.5.25 │ c4:██:██:██:██:2b │          │ Free   │
│ 5  │ 192.168.5.61 │ 8c:██:██:██:██:f5 │          │ Free   │
│ 6  │ 192.168.5.67 │ f0:██:██:██:██:b5 │          │ Free   │
└────┴──────────────┴───────────────────┴──────────┴────────┘

Evil Limiter Is Effective but Aggressive

In my tests with Evil Limiter, I found it to be an extremely effective if sometimes overbearing tool. On occasion, my attempts to limit a target would instead wholly block it, so be sure to test the effectiveness of this tool before using it anywhere important.

One thing to keep in mind when using Evil Limiter is that ARP spoofing exposes your MAC address, so using this tool on a network is effectively telling everyone that your MAC address is the router. That leaves your MAC address in the ARP cache of every machine you're targeting, so make sure to spoof your MAC address before using this tool if you don't want to be leaving your machine's fingerprints all over the network.

I hope you enjoyed this guide to using Evil Limiter
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
                Text("Control Network Traffic",
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
                        Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/em.png')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/em1.png')),
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
