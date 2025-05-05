import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rickandmorty_app/models/character.dart';
import 'package:rickandmorty_app/utils/constants.dart';

class ApiRickAndMorty {
  Future<RickAndMortyResponse?> getCharacters(int page) async {
    try {
      var url = Uri.parse('${Constants.apiCharacter}/?page=$page');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        RickAndMortyResponse result = rickAndMortyResponseFromJson(response.body);
        return result; 
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}