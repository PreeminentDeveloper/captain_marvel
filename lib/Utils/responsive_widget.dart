import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  
  final AppBar appBar;
  final Drawer drawer;
  final Widget Function(BuildContext context, SizedInformation constraints) builder;

  ResponsiveWidget({this.appBar, this.drawer, @required this.builder});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizedInformation sizedInformation = SizedInformation(width, height, orientation);

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: drawer,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context){
            return builder(context, sizedInformation);
          },
        ),
      ),
    );
  }
}