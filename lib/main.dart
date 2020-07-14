import 'package:captain_marvel/Nav_Bar/menu_bar.dart';
import 'package:captain_marvel/Screens/homepage.dart';
import 'package:captain_marvel/Utils/responsive_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Captain Marvel",
      theme: ThemeData(
        primaryColor: Colors.grey.shade900,
        fontFamily: 'Roboto'
      ),
      home: ResponsiveWidget(
        appBar: AppBar(
          title: Center(child: Image(image: AssetImage("lib/Images/marvel_logo.png"), width: 150.0, height: 150.0,)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.search, color: Colors.white,),
            )
          ],
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: MenuBar(),
        ),
        builder: (context, constraints){
          return Homepage(constraints);
        },
      ),
    );
  }
}