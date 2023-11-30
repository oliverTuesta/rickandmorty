import 'package:flutter/material.dart';
import 'package:rickandmorty/models/Character.dart';
import 'package:rickandmorty/persistence/repositories/character_repository.dart';
import 'package:rickandmorty/widgets/character_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  CharacterRepository characterRepository = CharacterRepository();
  List<Character>? _characters;

  @override
  void initState() {
    setState(() {
      _characters = [];
    });
    getFavorites();
    super.initState();
  }

  void getFavorites() async {
    _characters = await characterRepository.getAll();
    setState(() {
      _characters = _characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(child: CharacterListContainer(characters: _characters)));
  }
}
