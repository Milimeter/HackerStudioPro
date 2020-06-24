import 'package:flutter/material.dart';
import 'package:hackerstudiopro/main_screen.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HackerHome()));

class HackerHome extends StatefulWidget {
  @override
  _HackerHomeState createState() => _HackerHomeState();
}

class _HackerHomeState extends State<HackerHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF5CEB8),
        body: Container(
          child: Stack(children: [
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          height: 250,
                          width: 352,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2BEA1),
                          ),
                          child: Image.asset("assets/images/e.png"),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "HackerStudio ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                                fontFamily: "Cairo"),
                            children: [
                              TextSpan(
                                text: "Pro",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red,
                                    fontFamily: "Cairo"),
                              )
                            ]),
                        textAlign: TextAlign.center,
                      ),
                      // Text(
                      //   "HackerStudio Pro,",
                      //   style: TextStyle(
                      //       fontSize: 30,
                      //       fontWeight: FontWeight.bold,
                      //       fontStyle: FontStyle.italic,
                      //       color: Colors.grey,
                      //       fontFamily: "Cairo"),
                      //   textAlign: TextAlign.center,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainScreen())),
                          child: Container(
                            margin: EdgeInsets.only(top: 100),
                            width: size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2BEA1),
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 17,
                                  spreadRadius: -23,
                                  color: Colors.orangeAccent,
                                ),
                              ],
                            ),
                            child: Text(
                              "Start Course",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                     GestureDetector(
                       onTap: () {
                          showDisclaimer();
                          },
                                              child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text("Disclaimer", 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.italic
                          ),),
                        ),
                      )
                    ]),
              ),
            )
          ]),
        ));
  }

   void showDisclaimer(){
     showDialog(
       context: context,
       builder: (context){
         return AlertDialog(
           backgroundColor: Color(0xFFF5CEB8),
           title: Text("Disclaimer"),
           content: Text("I am not responsible for the inappropriate usage of the information present in this app, the contents are strictly meant for educational purpose"),
           actions: <Widget>[
             FlatButton(
               color: Colors.red,
               onPressed: ()=> Navigator.pop(context),
               child: Text('Exit'),
               )
           ],
           );
       }
       );
  }
}
