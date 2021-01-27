import 'package:flutter/material.dart';
import 'package:pojavlaunchermanager/model/release.dart';
import 'package:pojavlaunchermanager/ui/common/release_summary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        // color: new Color(0xFF736AB7),
        decoration: BoxDecoration(
          // gradient: SweepGradient(colors: [
          //   Colors.pink,
          //   Colors.red,
          //   Colors.green,
          //   Colors.purple,
          //   Colors.teal
          // ], stops: [
          //   0.8,
          //   0.96,
          //   0.74,
          //   0.22,
          //   0.85
          // ], startAngle: 0.5, endAngle: 1),
          image: DecorationImage(
            image: AssetImage("Assets/Images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new ReleaseSummary(releases[index]),
                  childCount: releases.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
