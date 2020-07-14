import 'package:captain_marvel/Screens/comic_issues.dart';
import 'package:captain_marvel/Screens/comics_screen.dart';
import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {

  // final SizedInformation constraints;
  // MenuBar(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                child: Image(
                  height: 270.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage("lib/Images/captain_marvel.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "CAPTAIN MARVEL", 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 25.0, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "(Carol Danvers)", 
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: 20.0, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  )
                )
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          ListTile(
            title: Text("Comics", style: TextStyle(color: Colors.red.shade100, fontSize: 18.0,),),
            trailing: Icon(Icons.image_aspect_ratio, color: Colors.red.shade100, size: 20.0,),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ComicsScreen())),
          ),
          ListTile(
            title: Text("Comics Issues", style: TextStyle(color: Colors.red.shade100, fontSize: 18.0,),),
            trailing: Text("#", style: TextStyle(color: Colors.red.shade100, fontSize: 20.0,)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ComicsIssues())),
          ),
          ListTile(
            title: Text("Close", style: TextStyle(color: Colors.red.shade100, fontSize: 18.0,),),
            trailing: Icon(Icons.close, color: Colors.red.shade100, size: 20.0,),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}