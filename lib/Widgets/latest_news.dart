import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:flutter/material.dart';

class LatesNews extends StatelessWidget {
  final SizedInformation constraints;

  LatesNews(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      alignment: Alignment.topLeft,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "LATEST NEWS",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: (){},
                    child: Card(
                      color: Colors.transparent,
                      child: Wrap(
                        children: <Widget>[
                          Image(
                            image: AssetImage("lib/Images/comics1.jpg"),
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "COMICS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(height: 25.0,),
                          Text(
                            "A Shocking Ending Awaits in 'Empyre' #4",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: (){},
                    child: Card(
                      color: Colors.transparent,
                      child: Wrap(
                        children: <Widget>[
                          Image(
                            image: AssetImage("lib/Images/comics2.jpg"),
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "COMICS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(height: 25.0),
                          Text(
                            "Artist Cory Smith Joins 'Captain Marvel' As Carol Danvers Enters as the Accuser",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: (){},
                    child: Card(
                      color: Colors.transparent,
                      child: Wrap(
                        children: <Widget>[
                          Image(
                            image: AssetImage("lib/Images/comics3.jpg"),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "COMICS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            "A History of Accusers and Captain Marvel's New Role",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: (){},
                    child: Card(
                      color: Colors.transparent,
                      child: Wrap(
                        children: <Widget>[
                          Image(
                            image: AssetImage("lib/Images/comics4.jpg"),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "CULTURE & LIFESTYLE",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            "Peek Inside the Pages of 'Beware the Flerkenl' With Writer Calliope Glass and Illustrator Rob McClurkan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
