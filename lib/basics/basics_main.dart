import 'package:flutter/material.dart';
import 'package:hackerstudiopro/basics/contents/five.dart';
import 'package:hackerstudiopro/basics/contents/four.dart';
import 'package:hackerstudiopro/basics/contents/one.dart';
import 'package:hackerstudiopro/basics/contents/six.dart';
import 'package:hackerstudiopro/basics/contents/three.dart';
import 'package:hackerstudiopro/basics/contents/two.dart';
import 'package:hackerstudiopro/main_screen.dart';


class BasicsMain extends StatefulWidget {
  @override
  _BasicsMainState createState() => _BasicsMainState();
}

class _BasicsMainState extends State<BasicsMain> {
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
              "Basics",
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              "Learn the Basics of Ethical Hacking", 
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsFirst())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "What is Ethical Hacking",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Understanding the basic concept of ethical hacking"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsSecond())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Not being a Skid",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Always learn the basics of everything"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsThree())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Cheat Engines",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text("Metasploit and other exploitation tools"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsFour())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Social Engineering",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("The Art of Human Hacking"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsFive())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Understanding Malwares",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Understanding the basics Virus, Worms and Ransomewares"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
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
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> BasicsSix())),
                        leading: Icon(
                          Icons.table_chart,
                          color: Colors.green,
                          size: 40,
                        ),
                        title: Text(
                          "Limits of Legality",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("How not to get a Tour to Prison"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                  ),
                  Divider()
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
