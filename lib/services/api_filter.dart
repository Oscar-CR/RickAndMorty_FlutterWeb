import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rickandmorty_app/models/character.dart';
import 'package:rickandmorty_app/utils/constants.dart';

class ApiFilterCharacter {
  Future<RickAndMortyResponse?> getCharacters(String name) async {
    try {
      var url = Uri.parse('${Constants.apiCharacter}/?name=$name');
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