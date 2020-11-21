import 'dart:convert';
import 'package:http/http.dart' as http;

const String API_KEY = "715f9ee686ba92711f8ab0bc321130c7";
const String URL =
    "https://api.themoviedb.org/3/list/7065793?api_key=$API_KEY&language=fr-FR";

main(List<String> args) async {
  List movies = [];
  var s = await getSeries();
  putSeries(jsonEncode(s["items"]));
}

Future<dynamic> getSeries() async {
  var result =
      await http.get(URL, headers: {'Content-Type': 'application/json'});
  print("Status Code:" + result.statusCode.toString());
  return jsonDecode(result.body);
}

Future<void> putSeries(String body) async {
  var result = await http.post("https://vellas.herokuapp.com/api/v1/catalog",
      body: body, headers: {'Content-Type': 'application/json'});
  print(result.statusCode.toString() + "reason :" + result.body);
}

Future<dynamic> getSeriesDetails(int id) async {
  var result = await http.get(
      "https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY&language=fr-FR");
  if (result.statusCode == 200) {
    print("movie details get succefully");
    return jsonDecode(result.body);
  } else {
    return null;
  }
}
