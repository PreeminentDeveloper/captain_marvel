import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:flutter/material.dart';

class LatestVideos extends StatelessWidget {

  final SizedInformation constraints;
  LatestVideos(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      alignment: Alignment.topLeft,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "LATEST VIDEOS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0,),
          GestureDetector(
            onTap: (){},
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  image:AssetImage("lib/Images/comics_video.jpg"),
                ),
                Container(
                  color: Colors.white,
                  height: 60.0,
                  width: 60.0,
                ),
                Icon(Icons.play_arrow, color: Colors.red, size: 30.0,),
                Container(
                  color: Colors.black54,
                  width: 45.0,
                  height: 25.0,
                  margin: EdgeInsets.only(left: 250.0, top: 120.0)
                ),
                Container(
                  margin: EdgeInsets.only(left: 250.0, top: 120.0),
                  child: Text(
                    "2:46",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Text(
            "MARVEL CULTURE & LIFESTYLE",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13.0),
          ),
          SizedBox(height: 10.0,),
          Text(
            "DIY Captain Marvel's Star of Hala!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          SizedBox(height: 10.0,),
          Text(
            "Your Marvel Mission was to create Captain Marvel's Star of Hala using only safe household items! Lorraine Cink highlights a few of her favorites while making her own Star of Hala!",
            style: TextStyle(fontSize: 15.0),
            strutStyle: StrutStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
