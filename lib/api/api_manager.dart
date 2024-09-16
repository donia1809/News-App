import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/models/responses/News_response.dart';
import 'package:news_app/api/models/responses/sources_response.dart';

class EndPoints
{
  static const String SOURCES = "v2/top-headlines/sources";
  static const String NEWS = "v2/top-headlines";
}
class ApiManager {

  static const String baseUrl = "newsapi.org";

  static const String apiKey = "f036b140c52040378ff7453427297ba8";

  static Future<SourcesResponse?> getSourcesByCategoryId(String categoryId) async
  {
    var url = Uri.https(baseUrl, EndPoints.SOURCES,
        //parameters
        { "apiKey": apiKey,
          "category": categoryId
        });
    try{
      var response = await http.get(url, headers: { "X-Api-Key": apiKey});
      var json = jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }
    catch(e){
      return null;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async
  {
    var url = Uri.https(baseUrl, EndPoints.NEWS,
        //parameters
        { "apiKey": apiKey,
          "sources": sourceId
        });
    try{
      var response = await http.get(url, headers: { "X-Api-Key": apiKey});
      var json = jsonDecode(response.body);
      print("json2:$json");
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }
    catch(e){
      return null;
    }
  }

  static Future<NewsResponse?> SearchNews(String query) async
  {
    var url = Uri.https(baseUrl, EndPoints.NEWS,
        //parameters
        { "apiKey": apiKey,
          "q": query
        });
    try{
      var response = await http.get(url, headers: { "X-Api-Key": apiKey});
      var json = jsonDecode(response.body);
      print("json2:$json");
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }
    catch(e){
      return null;
    }
  }
}