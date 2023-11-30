import 'package:flutter/material.dart';
import 'package:rickandmorty/models/Character.dart';
import 'package:rickandmorty/services/CharacterService.dart';
import 'package:rickandmorty/widgets/character_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  CharacterService characterService = CharacterService();
  List<Character>? _characters;

  void getCharacters() async {
    _characters = await characterService.getCharactersByPage(1);
    setState(() {
      _characters = _characters;
    });
  }

  void initState() {
    setState(() {
      _characters = [];
    });
    getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(child: CharacterListContainer(characters: _characters)));
  }
}
