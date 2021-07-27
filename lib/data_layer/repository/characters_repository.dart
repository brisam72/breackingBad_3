import 'package:bloc_breacking_3/data_layer/models/character.dart';
import 'package:bloc_breacking_3/data_layer/web_services/characters_webservices.dart';
//import 'package:flutter/material.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final charaters =await charactersWebServices.getAllCharacters();
    return charaters.map((charcater)=>Character.fromJson(charcater)).toList();
  }
}
