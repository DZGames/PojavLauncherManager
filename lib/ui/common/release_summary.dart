import 'package:flutter/material.dart';
import 'package:pojavlaunchermanager/model/release.dart';
import 'package:pojavlaunchermanager/ui/common/separator.dart';
import 'package:pojavlaunchermanager/ui/detail/detail_page.dart';
import 'package:pojavlaunchermanager/ui/text_style.dart';

class ReleaseSummary extends StatelessWidget {
  final Release myrelease;
  final bool horizontal;

  ReleaseSummary(this.myrelease, {this.horizontal = true});

  ReleaseSummary.vertical(this.myrelease) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final releaseThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "myrelease-hero-${myrelease.id}",
        child: new Image(
          image: new AssetImage(myrelease.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _releaseValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(value, style: Style.smallTextStyle),
          ],
        ),
      );
    }

    final releaseCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(myrelease.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(myrelease.creator, style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _releaseValue(
                      value: myrelease.version,
                      image: 'Assets/Images/ic_distance.png')),
              new Container(
                width: horizontal ? 8.0 : 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _releaseValue(
                      value: myrelease.builddate,
                      image: 'Assets/Images/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final releaseCard = new Container(
      child: releaseCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF3E2723),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(myrelease),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              releaseCard,
              releaseThumbnail,
            ],
          ),
        ));
  }
}
