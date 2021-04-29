import 'package:flutter/material.dart';
import 'package:pojavlaunchermanager/model/release.dart';
import 'package:pojavlaunchermanager/ui/common/release_summary.dart';
import 'package:pojavlaunchermanager/ui/common/separator.dart';
import 'package:pojavlaunchermanager/ui/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Release myrelease;

  DetailPage(this.myrelease);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF795548),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        myrelease.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00736AB7), new Color(0xFF388E3C)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "DESCRIPTION".toUpperCase();
    final _downloadTitle = "DOWNLOAD".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new ReleaseSummary(
            myrelease,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(myrelease.description, style: Style.commonTextStyle),
                new SizedBox(height: 20),
                new Text(
                  _downloadTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text(
                  "You are going to download files from PojavLauncher directly hosted on Github",
                  style: Style.commonTextStyle,
                ),
                new SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    _launchURL(myrelease.url);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.symmetric(),
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
                    child: new Text("Download Minecraft " + myrelease.version,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                new Text(
                  "Bugs and errors",
                  style: Style.headerTextStyle,
                ),
                // new Spacer(),
                new Separator(),
                new Row(children: <Widget>[
                  new Text(
                    "Any error? Join our Telegram Support Channel!",
                    style: Style.commonTextStyle,
                  ),
                  new ElevatedButton(
                    child: Text("Telegram Support"),
                    onPressed: () {
                      _launchURL("https://t.me/pojavlauncher");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
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
