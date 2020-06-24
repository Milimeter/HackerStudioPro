import 'package:flutter/material.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';
class TricksSix extends StatefulWidget {
  @override
  _TricksSixState createState() => _TricksSixState();
}

class _TricksSixState extends State<TricksSix> {

  var text = '''
  Privilege escalation allows us to elevate privileges from our less privileged user (l3s7r0z) to a more privileged one, preferably the SYSTEM user, which has all administrative rights.

Metasploit by default provides us with some methods that allow us to elevate our privileges. On the Meterpreter prompt we use the getsystem command, as shown below:
  ''';
  var text1 = '''
  Since the methods used by getsystem all fail, we need an alternative method of elevating privileges. We will use the comhijack exploit module that is used to bypass User Access Control. To do so, we “background” our Meterpreter session, switch our exploit from multi/handler to windows/local/bypassuac_comhijack and implement this on the session in the background using set SESSION 2.

This is shown below:
  ''';
  var text2 = '''
  We then set the payload using set payload windows/x64/meterpreter/reverse_tcp and set the LPORT and LHOST. We then run the exploit.
  ''';
  var text3 = '''
  We successfully receive a Meterpreter session. Typing sysinfo shows us the information of our target. getuid shows that we are running as user l3s7r0z on Windows 10, but we can elevate to SYSTEM by issuing getsystem. We can see that elevation was successful and we can confirm this by issuing getuid again, we can see we are now NT AUTHORITY\SYSTEM.


  ''';
  var text4 = '''
  With these privileges, we can do quite a lot on our compromised target. For instance, we can obtain LM and NTLM password hashes using the hashdump command as shown above. Note that the format of the hashes above is USERNAME:SID:LM_HASH:NTLM_HASH:::. We can even obtain credentials from browsers, key managers, the domain controller, perform keylogging, capture screenshots and even stream from the webcam (this will not work on VM, it will need an actual native Windows install target).

Now that we are within the target machine, why not perform some persistence to remain within?
Persistence

Persistence allows us to gain access back to the machine whenever we need to even when the target decides to patch the vulnerability.

There are many ways of performing persistence. For example, we can code a malicious virus to always connect back to us whenever the target turns on their machine (this is called a backdoor), or even have our own user accounts within the compromised target machine. Metasploit also provides its method of persistence.

Today, we’ll go with the second option, to have our own account within the target and enable RDP so that whenever we want, we can log into the machine and access the information we want.

Remember the NTLM hashes we were able to obtain above using the hashdump command from the mimikatz module? We can even log into any account within the target machine using any password hashes, impersonate legitimate users and download, alter or upload files.

On the Meterpreter session, we type the command shell to drop into a Windows shell on the Windows 10 target.
  ''';
  var text5 = '''
  At the C:\WINDOWS\system32> prompt, we issue the net users command. This lists all the users within the windows machine. As we can see, there are only two users, the Administrator and the l3s7r0z user.

We add a new user Jaime and give him the password Bru73f0rc3_

The command used to do that is:

net user /add jaime Bru73f0rc3_

We then add Jaime to the administrators group so that the account can perform admin functions. The command used is:

net localgroup administrators jaime /add

We then add him to the RDP group. This will allow us to log in through RDP to the target machine, even after it has been patched to have firewall and antivirus on.

The command used is:

net localgroup “Remote Desktop Users” jaime /add

After all the setup is done for user Jaime, we can use the following command to see the user’s properties:

net user jaime

The screenshot below shows the output of the command.
  ''';
  var text6 = '''
  In some cases RDP is not enabled at the target machine. As long as we are within the shell, we can enable it by adding a registry key.

To enable RDP, use the following command:

reg add “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server” /v fDenyTSConnections /t REG_DWORD /d 0 /f

If you would like to disable RDP for whatever purpose, you can do so by typing the following command:

reg add “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server” /v fDenyTSConnections /t REG_DWORD /d 1 /f

The result of the operation is shown below:
  ''';
  var text7 = '''
  From the Kali Linux machine, we can use the remmina remote connection client. If it is not installed within Kali, you can install it by typing the following command:

apt-get install remmina

Start remmina by typing remmina on the command prompt. And connect to the target using its IP address.
  ''';
  var text8 = '''
  You will be required to accept a certificate. Do so and use the username and password used to register the Jaime account. That is:

Username: jaime

Password: Bru73f0rc3_

By default, in Windows 10, the logged-in user using Windows 10 will be required to allow you to connect. However, if they do not respond within 30 seconds, they are automatically logged out.
  ''';
  var text9 = '''
  Conclusion

In this article we have seen how the Metasploit Framework can be used to compromise a Windows 10 machine to gain a Meterpreter session. We have used Shellter to FUD our malicious executable to bypass the Windows 10 antivirus and performed privilege escalation to gain more rights on our compromised machine.

Hackers are not limited in what they can use the framework for. For instance, it can also be used to perform information gathering and pivoting through compromised networks.
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
                        MaterialPageRoute(builder: (context) => TricksMain())),
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
                Text("Privilege Escalation",
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
                       Container(child: Image.asset('assets/images/shellter10.png')),
                       Text(
                          text1,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter11.png')),
                       Text(
                          text2,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter12.png')),
                       Text(
                          text3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter13.png')),
                       Text(
                          text4,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter14.png')),
                       Text(
                          text5,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                        Container(child: Image.asset('assets/images/shellter15.png')),
                        Text(
                          text6,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter16.png')),
                       Text(
                          text7,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter17.png')),
                       Text(
                          text8,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16, fontFamily: "Cairo"),
                        ),
                       Container(child: Image.asset('assets/images/shellter18.png')),
                       Text(
                          text9,
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
