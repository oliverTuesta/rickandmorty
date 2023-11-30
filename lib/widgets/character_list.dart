import 'package:flutter/material.dart';
import 'package:rickandmorty/models/Character.dart';
import 'package:rickandmorty/widgets/character_card.dart';

class CharacterListContainer extends StatefulWidget {
  final List<Character>? characters;

  const CharacterListContainer({super.key, required this.characters});

  @override
  State<CharacterListContainer> createState() => _CharacterListContainerState();
}

class _CharacterListContainerState extends State<CharacterListContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        key: UniqueKey(),
        children: [
          Text(
            "Search results (${widget.characters!.length}):",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...widget.characters!
              .map((character) => CharacterCard(character: character))
              .toList()
        ],
      ),
    );
  }
}
