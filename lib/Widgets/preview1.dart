import 'package:flutter/material.dart';

class Preview1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("CAROL DANVERS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800)),
          Text("CAPTAIN MARVEL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 12.0),
          Text(
              "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.",
              strutStyle: StrutStyle(height: 1.5),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              )),
        ],
      ),
    );
  }
}
