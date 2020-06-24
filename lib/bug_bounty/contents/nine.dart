import 'package:flutter/material.dart';
import 'package:hackerstudiopro/bug_bounty/web_main.dart';
class BountyNine extends StatefulWidget {
  @override
  _BountyNineState createState() => _BountyNineState();
}

class _BountyNineState extends State<BountyNine> {
  var text = '''
  Manual SQL Injection
SQLmap (http://sqlmap.org/) (Kali Linux)
The command line version has all the same functionality as through Burp. In the following examples, I will show both a GET parameter and a POST parameter example with SQLmap, since they are the most commonly identified types of SQLi. The reason I show both HTTP method attacks is because if you don't have the request properly configured, it is very likely the attack will fail.
Here is a look at the help file for SQLmap. There are a lot of different switches that can be used forSQLi attacks: 

sqlmap -h.

  ''';
  var text1 = '''

  GET Parameter Example
In the following examples, we are going to assume that the GET parameter is where the SQLi vulnerability is located with the URL. We want to test every parameter and make sure that the SQLi vulnerability is really a finding. There are a good number of false positives I have seen   with scanner tools, so validation is really the only method for ensuring the findings. Remember that if you do not specify a value to test, SQLmap will test every parameter by default.
● Here is an example command to identify if an SQL injection vulnerability using the banner switch:
● cd /opt/sqlmap
● python ./sqlmap.py -u "http://site.com/info.php?user=test&pass=test" -b
For example, we will attack our vulnerable virtual machine (OWASPBWA):
● python ./sqlmap.py -u "http://192.168.1.124/mutillidae/index.php?page=userinfo.php&username=asdf&password=sdf&user-info-php-submit-button=View+Account+Details" –b


  ''';
  var text2 = '''

  Retrieving the database username:
● python ./sqlmap.py -u "http://site.com/info.php?user=test&pass=test" --current-user
Interactive Shell
● python ./sqlmap.py -u "http://site.com/info.php?user=test&pass=test" --os-shell
Some hints and tricks:
● You might need to define which type of database to attack. If you think an injection is possible, but SQLmap is not finding the issue, try to set the --dbms=[database type] flag.
● If you need to test an authenticated SQL injection finding, log into the website via a browser and grab the Cookie (you can grab it straight from Burp Suite). Then, define the cookie using the --cookie=[COOKIE] switch.
● Stuck? Try the command: sqlmap --wizard.
  ''';
  var text3 = '''
  POST Parameter Example
POST examples are going to mimic GET injections, except for how the vulnerable parameter is passed. Instead of being in the URL, the POST parameters are passed in the data section. This is normally seen with username and passwords since the web servers generally log GET parameters and you wouldn't want the web server to log passwords. Also, there are size limitations with GET methods and, therefore, a lot of data will be passed via POST parameters for larger applications. Determining if an SQL inject is valid (the result will be the banner if valid):
● python ./sqlmap.py -u "http://site.com/info.php " --data= "user=test&pass=test" -b
For example, we will attack our vulnerable virtual machine (OWASPBWA):
● python ./sqlmap.py -u "http://192.168.1.124/mutillidae/index.php?page=user-info.php&username=asdf&password=asdf&user-info-php-submit-
button=View+Account+Details" -b
  ''';
  var text4 = '''
  Retrieving the database username:
● python ./sqlmap.py -u "http://site.com/info.php --data= "user=test&pass=test" --current-user
Interactive Shell:
● python ./sqlmap.py u "http://site.com/info.php --data= "user=test&pass=test" --os-shell
If you are able to gain access to an os-shell, you will have full command line access as the database user. In the following example, I was able to find a vulnerable SQLi, gain an os-shell, and run an ipconfig command.

I recommend spending some time getting used to running different SQLi commands and trying different switches identified in the help file. If SQLmap fails, it might be your configuration, so make sure you try using the Wizard setup, also.
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
                Text("Exploiting SQL Injections",
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
                       Container(child: Image.asset('assets/images/sql.jpg')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/sql1.jpg')),
                        Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),

                        Container(child: Image.asset('assets/images/sql2.jpg')),
                        Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/sql3.jpg')),
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
