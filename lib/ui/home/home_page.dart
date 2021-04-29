import 'package:flutter/material.dart';

import 'package:pojavlaunchermanager/ui/home/home_page_body.dart';
import 'package:pojavlaunchermanager/ui/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Pojav Launcher Manager"),
          new HomePageBody(),
          new FooterBar(),
        ],
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 60.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24.0),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [const Color(0xFF795548), const Color(0xFFFB8C00)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}

class FooterBar extends StatelessWidget {
  // final String title;
  final double barHeight = 40.0;

  // FooterBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        child: new Row(
          children: <Widget>[
            new Spacer(),
            new Column(
              children: <Widget>[
                new ElevatedButton(
                  child: Text("Manager Source Code"),
                  onPressed: () {
                    _launchURL(
                        "https://github.com/DZGames/PojavLauncherManager");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF795548),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
            ),
            new Spacer(),
            new Column(
              children: <Widget>[
                new ElevatedButton(
                  child: Text("Launcher Source Code"),
                  onPressed: () {
                    _launchURL(
                        "https://github.com/PojavLauncherTeam/PojavLauncher");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF795548),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
            ),
            new Spacer(),

            new Column(
              children: <Widget>[
                new ElevatedButton(
                  child: Text("Telegram Support"),
                  onPressed: () {
                    _launchURL(
                        "https://t.me/pojavlauncher");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF795548),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
            ),
            new Spacer(),

            new Column(
              children: <Widget>[
                new ElevatedButton(
                  child: Text("Other releases"),
                  onPressed: () {
                    _launchURL(
                        "https://github.com/PojavLauncherTeam/PojavLauncher/releases");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF795548),
                    onPrimary: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ],
            ),
            new Spacer(),
          ],
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [const Color(0xFF795548), const Color(0xFFFB8C00)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}

_launchURL(myurl) async {
  var url = myurl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
