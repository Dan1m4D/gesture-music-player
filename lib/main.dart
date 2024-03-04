import 'package:flutter/material.dart';
import 'package:gesture_music_app/models/favorites_provider.dart';
import 'package:gesture_music_app/pages/tabgroup.dart';
import 'package:gesture_music_app/themes/theme_provider.dart';
import 'package:gesture_music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      home: const TabGroup(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
