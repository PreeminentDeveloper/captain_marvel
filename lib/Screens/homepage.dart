import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:captain_marvel/Widgets/captain_marvel_comics.dart';
import 'package:captain_marvel/Widgets/latest_news.dart';
import 'package:captain_marvel/Widgets/latest_videos.dart';
import 'package:captain_marvel/Widgets/preview1.dart';
import 'package:captain_marvel/Widgets/preview2.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final SizedInformation constraints;
  Homepage(this.constraints);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.grey.shade900,
          child: Column(
            children: <Widget>[
              Image(
                width: constraints.width,
                  image: AssetImage("lib/Images/CaptainMarvel2.jpg"),
                  fit: BoxFit.fitWidth),
              Column(
                children: <Widget>[
                  Preview1(),
                  Column(
                    children: <Widget>[
                      Preview2(),
                      LatesNews(constraints),
                      LatestVideos(constraints),
                      CaptainMavelComics(constraints),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
