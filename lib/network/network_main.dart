import 'package:flutter/material.dart';
import 'package:hackerstudiopro/main_screen.dart';
import 'package:hackerstudiopro/network/contents/eight.dart';
import 'package:hackerstudiopro/network/contents/five.dart';
import 'package:hackerstudiopro/network/contents/four.dart';
import 'package:hackerstudiopro/network/contents/nine.dart';
import 'package:hackerstudiopro/network/contents/one.dart';
import 'package:hackerstudiopro/network/contents/seven.dart';
import 'package:hackerstudiopro/network/contents/six.dart';
import 'package:hackerstudiopro/network/contents/three.dart';
import 'package:hackerstudiopro/network/contents/two.dart';
class NetworkMain extends StatefulWidget {
  @override
  _NetworkMainState createState() => _NetworkMainState();
}

class _NetworkMainState extends State<NetworkMain> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          // Here the height of the container is 45% of our total height
          height: size.height * .35,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        SafeArea(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainScreen())),
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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    height: 200,
                    width: 352,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                    ),
                    child: Image.asset("assets/images/e.png"),
                  ),
                ),
              ],
            ),
            Text(
              "Network PenTesting",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              "Learn how to perform network penetration testing",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Course Contents",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkFirst())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Network Penetration Testing",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Understanding the basic concept of hacking into wired or wireless networks"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkThird())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Networking",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Looking before you Leap"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkTwo())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Breaking into Router Gateway", 
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Gaining Access to a router's dashboard"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkFour())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Deauthing WiFi Signals",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A simple way to perform DOS attacks on networks"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkFive())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Exploiting Wireless Routers 1",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A complicated but easy way to exploit vulnerabilities on wireless routers"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkSix())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Hack Wi-Fi Networks with Bettercap",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "How to use Bettercap's modules to help us search for weak Wi-Fi passwords."),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkSeven())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Control Network Traffic",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            " Using Evil Limiter to Throttle or Kick Off Devices"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkEight())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "Automate Wi-Fi Hacking with Wifite2",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "A powerful tool that automates Wi-Fi hacking"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NetworkNine())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.red,
                          size: 40,
                        ),
                        title: Text(
                          "MAC Address Spoofing ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Hack Open Hotel, Airplane & Coffee Shop Wi-Fi with MAC Address Spoofing "),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider(),
                  
                  
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
