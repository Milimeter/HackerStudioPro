import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackerstudiopro/about_dev.dart';
import 'package:hackerstudiopro/basics/basics_main.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';
import 'package:hackerstudiopro/constants.dart';
import 'package:hackerstudiopro/network/network_main.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Stack(children: [
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutPage())),
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        // color:Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/images/menu.svg"),
                    ),
                  ),
                ),
                Text(
                  "Choose A Category",
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Text(
                  "Some people can read about war and peace, come away thinking its a simple adventure story \n "
                  "while some people can read the ingredients at the back of a chewing gum wrapper then unlocking the secrets of the universe. Look closer and you might see the crazy things this app has to offer.",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(
                        title: "Basics",
                        //svgSrc: "assets/icons/Hamburger.svg",
                        asset: "assets/images/e.png",

                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BasicsMain()));
                        },
                      ),
                      CategoryCard(
                        title: "Web-Based Exploitation",
                        //svgSrc: "assets/icons/Excrecises.svg",
                        asset: "assets/images/a.jpg",
                        press: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebMain()));
                        },
                      ),
                      CategoryCard(
                        title: "Network PenTesting",
                        //svgSrc: "assets/icons/Meditation.svg",
                        asset: "assets/images/b.jpg",
                        press: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NetworkMain()));
                        },
                      ),
                      CategoryCard(
                        title: "Hacking Tricks",
                        //svgSrc: "assets/icons/yoga.svg",
                        asset: "assets/images/c.png",
                        press: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TricksMain()));
                        },
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class CategoryCard extends StatelessWidget {
  //final String svgSrc;
  final String title;
  final Function press;
  final String asset;
  const CategoryCard({
    Key key,
    //this.svgSrc,
    this.asset,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          //color: Colors.white,
          color: Color(0xFFF2BEA1),
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  // SvgPicture.asset(svgSrc),
                  Image.asset(asset),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

