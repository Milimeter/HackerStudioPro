import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyEleven extends StatefulWidget {
  @override
  _BountyElevenState createState() => _BountyElevenState();
}

class _BountyElevenState extends State<BountyEleven> {
  var text = '''
  Cross-Site Request Forgery (CSRF)
Cross-Site Request Forgery basically allows you to force an unwanted action onto the victim. For example, you send a link to someone who is currently logged into their bank account. When that person accesses your link, it automatically transfers money out of their account into your account. This happens when there is no verification process to check that the user went through the appropriate steps to transfer money. What I mean is that in order to transfer money, a user needs to login, go to their transfer payment page, select the recipient and then transfer the money. When these appropriate steps are taken, a CSRF token is generated on each and every page as you progress through the application. Additionally the previous token is verified before the next step can process. You can think of this as a tracking system if any of those tokens are empty or wrong, the transaction does not process.

There are many complex ways to test this, but the easiest way to manually run these tests is through proxying traffic. I will go through the process of making a transaction as described above and see if I can replay it. However, in the replay, my goal is to get the same end result without having to go through all of the steps, which proves that there is a CSRF vulnerability. Using Burp for CSRF Replay Attacks Let's take an example where a bank application allows transfers from one user to another. In the URL below, there are two parameters that are used. The first parameter is User (to whom the money will go). The second parameter is the dollar amount. In the case below, we successfully  transferred money to Frank.

What would happen if I sent this same URL to another person who was already logged into the same bank application? Well, if a CSRF protection were not in place, it would transfer \$123.44 from the victim host to Frank, instantly.
  ''';
  var text1 = '''
  To test if this is possible, we first capture the request via Burp. Make sure that your browser is still proxying to Burp and make the request with user 1. This should work just fine as you went through the proper channels to make the transfer. You should be able to log in, go to the transfer page, fill in the information, and submit. In the example below, we can go to Burp's Proxy Tab and the History to see our last requests. At thevery bottom, we see the request for the bank transfer. We also see that there is a hook cookie, but nothing that looks like a CSRF token.
  ''';
  var text2 = '''
  To validate this, we can actually try to repeat the request. I usually try this method because it tells me instantly if I can repeat requests without having to perform any additional actions. If you right-click anywhere in the Raw Request area, the option to "Send to Repeater" appears.
  ''';
  var text3 = '''
  Inside the Repeater Tab, pressing the Go button will repeat the request and the following response will be populated. The result in our example was that the amount was transferred again without any verification from the user that this request was actually intended. This is great because you could send that same link to every user of this bank and Frank would become an instant millionaire.
  ''';
  var text4 = '''
  The application shouldn't have allowed the user to transfer money again without going through all the steps required to create a transfer request. Without a CSRF token, you could have an unsuspecting victim click on a link and have unauthorized transfers occur. If you are looking for more information on CSRF attacks, go to OWASPs page:
https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF).
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
                Text("Cross-Site Request Forgery",
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
                       Container(child: Image.asset('assets/images/csrf.jpg')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/csrf1.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),

                        Container(child: Image.asset('assets/images/csrf2.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/csrf3.jpg')),
                        Text(
                          text4,
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
