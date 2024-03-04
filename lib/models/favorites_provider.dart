import 'package:flutter/material.dart';
import 'package:gesture_music_app/models/song.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Song> _favorites = [];

  List<Song> get favorites => _favorites;

  void addFavorite(Song song) {
    _favorites.add(song);
  }

  void removeFavorite(Song song) {
    _favorites.remove(song);
  }

  bool isFavorite(Song song) {
    return _favorites.contains(song);
  }

  void toggleFavorite(Song song) {
    if (isFavorite(song)) {
      removeFavorite(song);
    } else {
      addFavorite(song);
    }
    notifyListeners();
  }
  
}