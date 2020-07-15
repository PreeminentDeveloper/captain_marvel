import 'package:captain_marvel/Utils/comics_data.dart';
import 'package:captain_marvel/Utils/http_service.dart';
import 'package:captain_marvel/Utils/responsive_widget.dart';
import 'package:flutter/material.dart';

class ComicsIssues extends StatefulWidget {
  @override
  _ComicsIssuesState createState() => _ComicsIssuesState();
}

class _ComicsIssuesState extends State<ComicsIssues> {

  ScrollController _scrollController = ScrollController();
  final HttpService httpService = HttpService();
  Future passComics;

  @override
  void initState() {
    super.initState();
    passComics = _getComics();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getMoreComics();
      }
    });
  }

  _getMoreComics(){
    print("Get more comics");
  }

  _getComics() async {
    return await httpService.getComics();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        builder: (context, constraints) => Container(
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Hero(
                          tag: "lib/Images/CaptainMarvel1.jpg",
                          child: Image.asset(
                            "lib/Images/CaptainMarvel1.jpg",
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
                            color: Color.fromRGBO(220, 250, 54, 1.0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: FutureBuilder(
                        future: passComics,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<ComicsData> comics = snapshot.data;
                            return ListView(
                              controller: _scrollController,
                              physics: BouncingScrollPhysics(),
                              children: comics
                                  .map(
                                    (ComicsData comics) => Container(
                                      child: GestureDetector(
                                          child:
                                              scrollList(comics.images, comics.title, comics.releaseDate),
                                          onTap: () {}),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else if(snapshot.hasError){
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
            ));
  }

  Container scrollList(String image, String title, String releaseDate) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 100.0,
                      child: Image(image: NetworkImage(image), fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            releaseDate,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
