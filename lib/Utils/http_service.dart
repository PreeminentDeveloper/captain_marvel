import 'package:captain_marvel/Utils/comics_data.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpService{

  final String comicUrl = "https://gateway.marvel.com/v1/public/characters/1010338/comics?ts=1&apikey=568cab46abc3d05e4b521cca2afc8eb4&hash=398b85d3f4bfd5ce47ee70171a7eb97b";
  Map body;

  Future<List<ComicsData>> getComics() async{

    Response response = await get(comicUrl);
    if(response.statusCode == 200){
      body = jsonDecode(response.body);
      List comics = body['data']['results'];
      // print(comics.toString());
      List<ComicsData>comicData = []; 

      for(var c in comics){
        ComicsData data = ComicsData(c["id"], c["title"], c["issueNumber"], c['images'][0]['path']+'.'+c['images'][0]['extension'], c['dates'][0]['date']);
        comicData.add(data);
      }

      return comicData;
    }else{
      throw "Can't get comics.";
    }

  }

}