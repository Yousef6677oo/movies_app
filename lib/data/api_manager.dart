import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/DetailsResponseDM.dart';
import '../model/GenreResponseDM.dart';
import '../model/LatestResponseDM.dart';
import '../model/PopularResponseDM.dart';
import '../model/SearchResponseDM.dart';
import '../model/SimilarResponseDM.dart';
import '../model/TopRatedResponseDM.dart';

abstract class ApiManager {
  static String baseUrl = "api.themoviedb.org";
  static String apiKey = "8cbd54442faeddc3454ec064b4eb3781";

  static Future<PopularDM> getPopular() async {
    Uri url = Uri.https(baseUrl, '3/movie/popular', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    PopularDM responseDM = PopularDM.fromJson(json);
    return responseDM;
  }

  static Future<TopRatedDM> getTopRated() async {
    Uri url = Uri.https(baseUrl, '3/movie/top_rated', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    TopRatedDM responseDM = TopRatedDM.fromJson(json);
    return responseDM;
  }

  static Future<SearchDM> getSearch(String query) async {
    Uri url = Uri.https(
        baseUrl, '3/search/movie', {"api_key": apiKey, "query": query});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    SearchDM responseDM = SearchDM.fromJson(json);
    return responseDM;
  }

  static Future<DetailsDM> getDetails(int movieID) async {
    Uri url = Uri.https(baseUrl, '3/movie/$movieID', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    DetailsDM responseDM = DetailsDM.fromJson(json);
    return responseDM;
  }

  static Future<SimilarDM> getSimilar(int movieID) async {
    Uri url =
        Uri.https(baseUrl, '3/movie/$movieID/similar', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    SimilarDM responseDM = SimilarDM.fromJson(json);
    return responseDM;
  }

  static Future<GenreDM> getGenre() async {
    Uri url = Uri.https(baseUrl, '3/genre/movie/list', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    GenreDM responseDM = GenreDM.fromJson(json);
    return responseDM;
  }

  static Future<LatestDM> getLatest() async {
    Uri url = Uri.https(baseUrl, '3/movie/latest', {"api_key": apiKey});
    http.Response response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    LatestDM responseDM = LatestDM.fromJson(json);
    return responseDM;
  }
}
