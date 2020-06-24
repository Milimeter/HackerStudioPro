import 'package:flutter/material.dart';
import 'package:hackerstudiopro/tricks/tricks_main.dart';


class TricksThree extends StatefulWidget {
  @override
  _TricksThreeState createState() => _TricksThreeState();
}

class _TricksThreeState extends State<TricksThree> {
  var text = '''
  There are more than 2 billion Android devices active each month, any of which can be hacked with the use of a remote administration tool, more commonly known as a RAT. AhMyth, one of these powerful tools, can help outsiders monitor a device's location, see SMS messages, take camera snapshots, and even record with the microphone without the user knowing.

Remote administration tools were first programs intended to provide technical support to remote computers by allowing an administrator to log in and control the device directly. However, hackers quickly saw the potential of these tools and started using them for more nefarious deeds. Today, advanced RATs are used to remotely access and control a wide variety of devices, but today we'll focus on one of the world's most popular — Android.

AhMyth is a new, up-and-coming, open-source Android RAT, currently in the beta stages of development, which uses a simple GUI interface. While Android RATs aren't a new thing, what makes this one stand out from the crowd is the simple and easy-to-understand graphical user interface. Additionally, AhMyth is multi-platform, available on Linux, Windows, and macOS.

The RAT consists of two parts. The first is a server-side application based on Electron framework, in our case, just our desktop or laptop, but this could be scaled up to some degree if needed. This acts as a control panel which we use to create and connect to the RAT. The second part is client side, which is the infected Android application we'll use as a backdoor.

STEP 1: Download & Install AhMyth

There are two ways to download and install AhMyth. The first is to directly use the source code from GitHub. The second is to use the binaries they provide.

METHOD 1: From Source Code

If you chose to start with the source code, then you'll need to check that you have a few prerequisites installed.

    Java — it's used to generate the APK backdoor.
    Electron — it's used to start the desktop application.
    Electron-builder and Electron-packer — they are used to build the binaries for macOS, Windows, and Linux.

Once you have those prerequisites, you're ready to proceed. First clone the code from GitHub with the following commands.

    git clone https://github.com/AhMyth/AhMyth-Android-RAT.git

Then move to the AhMyth-Android-Rat directory with the following.

    cd AhMyth-Android-RAT/AhMyth-Server

Once you're in, start AhMyth with the command below.

    npm start

This program is still in beta development, and as such, it isn't as robust as it could be. Some users have gotten errors when attempting to start it. If you do, try again running it as root, as seen below.

    sudo npm start --unsafe-perm

You'll know it's working when you see the GUI launch.

METHOD 2: From Binaries

The source code is one way to download it, but if you're lazy like me, there's a slightly easier way — use the binaries! It's particularly nice when you're working on a Windows computer and don't want to mess around with the command line. This shouldn't be a concern as most people will already have it, but do check that Java is updated on your computer.

Navigate to the AhMyth release page and download the release for your system. Currently, they only have Linux and Windows files uploaded.

Once you download the right file, open it up on your computer, and it should start installing. It will automatically open when it completes. After that, we should be ready to go!

STEP 2: Build an APK

Now that we have the program up and running, it's time to build an Android application with a backdoor. At the top of the screen, select "APK Builder." The first thing to change is "Source IP." This needs to be the IP address of the computer you'll be sending and receiving commands from.

For testing purposes, I'll just be using my local Wi-Fi network. However, if you wanted it to work outside of the local network, you would need to port-forward your computer to the internet and use your public IP address.

AhMyth can build an APK two different ways. It can create a standalone APK or be used to infect another application in order to remain hidden on the target device. To do the latter, select the box beside "Bind With Another Apk" and then browse and select the APK you wish to use. Today I'll just be creating the default standalone APK, but if a malicious user were deploying this in the real, they would very likely be binding it with another APK.

Once you have all the settings selected you're ready to build the APK, just click on "Build."

You can navigate to to "C:\Users\UserName\AhMyth\Output" to find the built APK.

STEP 3: Deploy the RAT

Now that you have a working APK, it's time to deploy it by downloading it on the target Android device. All of the standard attack methods apply — anything to get the user to download the APK. Social engineering tends to work best. For example, if you know the person, then recommend an app to them and infect it.

By far the most effective method is if you have physical access to the phone, it only takes a few seconds to download and hide it. If you chose this method, then an easy way to do it is by saving the APK to Google Drive and sending the phone a link. On most phones, the download should only take a second or two.

If the Android phone doesn't want to install it, they probably never enabled "Unknown sources" in their settings. Open up the Settings, then go to "Security" and check "Unknown sources." This is how apps that come from outside the Google Play Store can be installed.

STEP 4: Start to Listen

In the top left of the AhMyth screen, select the "Victims" tab, then change the Port number to the one you are using. You can also leave it blank for the default. Next, click on "Listen." Once this is done, and the RAT is running properly on the victim, then it should appear here along with some basic info.

STEP 5: Open the Lab

Now that you have a RAT up and running on the target device, you can start doing remote administration. Click on "Open The Lab" button, and a new pop-up window will appear. If you're familiar with other Android RATs like Cerberus, then you might be a little disappointed with how few features there are, but I would remind you that this is still only in the beta stages.

The features it does currently have are quite powerful. Let's take a look at a few of them. The "File Manager" is great because it lets you see everything on the device right down to the firmware. With this, you could potentially uncover all sorts of sensitive information, whether that be passwords and session cookies or compromising photos.

Another feature is the ability to record audio via "Mic." Since people take their phones with them everywhere they go, you, in effect, have a bug, or listening device, on them at all times.

Along the same lines as the last one, you also have a tracking function ("Location") so you can not only know what they said, but also where they said it. One note on this, however, is that it can be fooled by a simple GPS spoofer application. I used one on the victim device to take the screenshot below.

If you really like to sow chaos, then you'll love this next feature: the ability to not only read but also send "SMS" messages. A simple way to use this would be to hack someone's Facebook by resetting their password with an SMS text, then use the code that is sent. You can use your own imagination for all the things you can do by sending messages from the target's phone.

Now you may have noticed that I skipped over the "Camera" feature. I did that because I was unable to get it working on my device, which could just be a problem with the old Android I was using for testing. In principle, it's supposed to allow you to send commands to take pictures with the front or rear camera and have them sent back to you.

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
                Text("Hack into Android Phone",
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
