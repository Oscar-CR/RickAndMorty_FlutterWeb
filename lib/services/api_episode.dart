import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rickandmorty_app/models/episode.dart';
import 'package:rickandmorty_app/utils/constants.dart';

class ApiRickAndMorty {
  Future<RickAndMortyEpisodeResponse?> getEpisodes(int page) async {
    try {
      var url = Uri.parse('${Constants.apiEpisode}/?page=$page');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        RickAndMortyEpisodeResponse result = rickAndMortyEpisodeResponseFromJson(response.body);
        return result; 
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}