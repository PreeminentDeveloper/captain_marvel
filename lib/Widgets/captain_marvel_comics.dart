import 'package:captain_marvel/Screens/comics_screen.dart';
import 'package:captain_marvel/Utils/comics_data.dart';
import 'package:captain_marvel/Utils/http_service.dart';
import 'package:captain_marvel/Utils/sized_information.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class CaptainMavelComics extends StatefulWidget {
  final SizedInformation constraints;
  CaptainMavelComics(this.constraints);

  @override
  _CaptainMavelComicsState createState() => _CaptainMavelComicsState();
}

class _CaptainMavelComicsState extends State<CaptainMavelComics> {

  final HttpService httpService = HttpService();
  Future passComics;

  @override
  void initState() {
    super.initState();
    passComics = _getComics();
  }

  _getComics() async {
    return await httpService.getComics();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: constraints.height,
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
      alignment: Alignment.topLeft,
      width: widget.constraints.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "CAPTAIN MARVEL COMICS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 230.0,
              child: FutureBuilder(
                future: passComics,
                builder: (context2, snapshot2) {
                  if (snapshot2.hasData) {
                    List<ComicsData> comics = snapshot2.data;
                    return ListView(
                      padding: EdgeInsets.only(left: 15.0),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: comics
                          .map(
                            (ComicsData comics) => Container(
                              child: GestureDetector(
                                child: slide(comics.images, comics.title),
                                onTap: () {}
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  Container slide(String image, String title) {
    return Container(
      width: 150.0,
      child: FocusedMenuHolder(
        menuWidth: MediaQuery.of(context).size.width * 0.5,
        animateMenuItems: false,
        duration: Duration(milliseconds: 200),
        menuBoxDecoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.redAccent, blurRadius: 5, spreadRadius: 1)
          ]
        ),
        onPressed: (){},
        menuItems: <FocusedMenuItem>[
          FocusedMenuItem(
            title: Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 11.0, height: 1.0),
              )
            ),
            onPressed: (){}
          ),
        ],
        child: Card(
          elevation: 2.0,
          child: Image(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }

}
