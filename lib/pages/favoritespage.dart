import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/drawer.dart';
import 'package:gesture_music_app/components/neuitem.dart';
import 'package:gesture_music_app/models/favorites_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F A V O R I T E S"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: const AppDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<FavoritesProvider>(
        builder: (context, value, child) {
          final favorites = value.favorites;

          return favorites.isEmpty
              ? Center(
                  child: Text(
                    "No favorites yet",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return NeuListItem(
                      child: ListTile(
                        title: Text(favorites[index].title),
                        subtitle: Text(favorites[index].artist),
                        leading: ClipOval(
                          child: Image.asset(favorites[index].albumArtImagePath),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
