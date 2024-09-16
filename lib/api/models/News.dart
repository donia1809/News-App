
import 'sources.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Joel Khalili"
/// title : "The World’s Biggest Bitcoin Mine Is Rattling This Texas Oil Town"
/// description : "A cash-strapped city in rural Texas will soon be home to the world’s largest bitcoin mine. Local protesters are “raising hell.”"
/// url : "https://www.wired.com/story/the-worlds-biggest-bitcoin-mine-is-rattling-this-texas-oil-town/"
/// urlToImage : "https://media.wired.com/photos/66c5ecc5724cee849e3104da/191:100/w_1280,c_limit/WIRED_BTC_EC_B-Elena-Chudoba.jpg"
/// publishedAt : "2024-09-11T10:00:00Z"
/// content : "The previous October, Sawicky organized a weeklong protest alongside environmental activist group Greenpeace and brandished various anti-bitcoin signs at anyone who entered the Riot facility. Only a … [+3641 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}