import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Preview2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("FOLLOW",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                      color: Colors.grey.shade500)),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebookSquare),
                    color: Colors.grey.shade500,
                    iconSize: 19.0,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.grey.shade500,
                    iconSize: 19.0,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image(
                image: AssetImage("lib/Images/CaptainMarvel4.jpg"),
                height: 340.0,
                width: 340.0,
              ),
            ),
          ),
          Text("CAPTAIN MARVEL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
          SizedBox(height: 25.0),
          Text(
            "Near death, Carol Danvers was transformed into a powerful warrior for the Kree. Now, returning to Earth years later, she must remember her past in order to prevent a full invasion by shapeshifting aliens, the Skrulls.",
            style: TextStyle(fontSize: 15.0),
            strutStyle: StrutStyle(height: 1.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 120.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 40.0),
                child: Text(
                  "WATCH NOW",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red.shade700,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
            ),
          )
        ],
      ),
    );
  }
}
