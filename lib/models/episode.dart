import 'dart:convert';

RickAndMortyEpisodeResponse rickAndMortyEpisodeResponseFromJson(String str) => RickAndMortyEpisodeResponse.fromJson(json.decode(str));
String rickAndMortyEpisodeResponseToJson(RickAndMortyEpisodeResponse data) => json.encode(data.toJson());

class RickAndMortyEpisodeResponse {
  RickAndMortyEpisodeResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Episode> results;

  factory RickAndMortyEpisodeResponse.fromJson(Map<String, dynamic> json) => RickAndMortyEpisodeResponse(
    info: Info.fromJson(json["info"]),
    results: List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  int count;
  int pages;
  String? next;
  String? prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class Episode {
  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    id: json["id"],
    name: json["name"],
    airDate: json["air_date"],
    episode: json["episode"],
    characters: List<String>.from(json["characters"].map((x) => x)),
    url: json["url"],
    created: json["created"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "air_date": airDate,
    "episode": episode,
    "characters": List<dynamic>.from(characters.map((x) => x)),
    "url": url,
    "created": created,
  };
}