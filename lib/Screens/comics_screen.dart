import 'package:captain_marvel/Utils/comics_data.dart';
import 'package:captain_marvel/Utils/http_service.dart';
import 'package:captain_marvel/Utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class ComicsScreen extends StatefulWidget {
  @override
  _ComicsScreenState createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
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
    return ResponsiveWidget(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Container(
            height: constraints.height / 2,
            child: Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2.0,
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                          tag: "lib/Images/CaptainMarvel5.jpg",
                          child: Image.asset(
                            "lib/Images/CaptainMarvel5.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: Image.asset('lib/Images/nametag.png'),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 15,
                        child: Text(
                          "Captain Marvel",
                          style: TextStyle(
                            color: Colors.limeAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    'lib/Images/background1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    height: 230.0,
                    child: FutureBuilder(
                      future: passComics,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ComicsData> comics = snapshot.data;
                          return ListView(
                            padding: EdgeInsets.only(left: 15.0),
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: comics
                                .map(
                                  (ComicsData comics) => Container(
                                    child: GestureDetector(
                                        child:
                                            slide(comics.images, comics.title),
                                        onTap: () {}),
                                  ),
                                )
                                .toList(),
                          );
                        }else if(snapshot.hasError){
                            Text("Please check your internet conenection.", style: TextStyle(color: Colors.red),);
                          }
                        else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ],
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2.0,
            child: Image(
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }

}
