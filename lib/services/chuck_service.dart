import 'dart:convert';

import 'package:chuck_norris/models/chuck_model.dart';
import 'package:http/http.dart' as http;

class ServiceChuck {
  ServiceChuck();
  Future<List<Chuck>?> getChuck() async {
    List<Chuck> result = [];
    try {
      var url = Uri.parse('https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/search?query=town');
      var headers = {
        //accept: 'application/json',
        "x-rapidapi-host": "matchilling-chuck-norris-jokes-v1.p.rapidapi.com",
        "x-rapidapi-key": "825da8c4a5mshb86c1222d3f51c2p1edc22jsn0b2dd57561c0"
      };
      var response = await http.get(url, headers: headers);
      
      if (response.body.isEmpty) return result;
      //var content = json.decode(response.body);
      Map<String,dynamic> content=json.decode(response.body);
      List<dynamic> results=content["result"];
      // ignore: avoid_print
      //print(content);
      for (var item in results) {
        final table = Chuck.fromJson(item);
        result.add(table);
      }
      return result;
    } catch (ex) {
      return result;
    }
  }
}