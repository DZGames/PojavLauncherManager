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
          new Container(
            child: new Row(
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    _launchURL(
                        "https://github.com/DZGames/PojavLauncherManager");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.all(6.0),
                  elevation: 10,
                  splashColor: Colors.deepOrange[100],
                  child: Ink(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: new LinearGradient(
                        colors: [Colors.orange[500], Colors.orange[900]],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: new Text("Manager Source Code",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                new RaisedButton(
                  onPressed: () {
                    _launchURL(
                        "https://github.com/PojavLauncherTeam/PojavLauncher");
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.all(6.0),
                  elevation: 10,
                  splashColor: Colors.deepOrange[100],
                  child: Ink(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: new LinearGradient(
                        colors: [Colors.orange[500], Colors.orange[900]],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: new Text("Launcher Source Code",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          new HomePageBody(),
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

_launchURL(myurl) async {
  var url = myurl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
