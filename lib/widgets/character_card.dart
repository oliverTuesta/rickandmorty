import 'package:flutter/material.dart';
import 'package:rickandmorty/models/Character.dart';
import 'package:rickandmorty/persistence/repositories/character_repository.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  CharacterRepository characterRepository = CharacterRepository();
  bool isFavorite = false;
  late Character character;

  @override
  void initState() {
    character = widget.character;
    setState(() {
      isFavorite = false;
      character = character;
    });
    initialize();
    super.initState();
  }

  void initialize() async {
    isFavorite = await characterRepository.existById(character.id);
    if (mounted) {
      setState(() {
        isFavorite = isFavorite;
      });
    }
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await characterRepository.delete(character);
    } else {
      await characterRepository.insert(character);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(character.image),
        title: Text(character.name),
        subtitle: Text(character.status),
        // button to add to favorites
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          onPressed: toggleFavorite,
        ),
      ),
    );
  }
}
