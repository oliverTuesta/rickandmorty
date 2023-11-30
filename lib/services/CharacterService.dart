import 'dart:convert';
import 'package:rickandmorty/models/Character.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final String base_url = "https://rickandmortyapi.com/api";

  Future<List<Character>> getCharactersByPage(int page) async {
    final response =
        await http.get(Uri.parse("$base_url/character?page=$page"));
    final data = jsonDecode(response.body);
    final characters = data["results"] as List;
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
