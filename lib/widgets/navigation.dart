import 'package:flutter/material.dart';
import 'package:rickandmorty/screens/characters_screen.dart';
import 'package:rickandmorty/screens/favorites_screen.dart';
import 'package:rickandmorty/screens/home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: IndexedStack(
        index: index,
        children: const <Widget>[
          HomeScreen(),
          CharactersScreen(),
          FavoritesScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int tappedIndex) {
          setState(() {
            index = tappedIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
