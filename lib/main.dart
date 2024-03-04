import 'package:flutter/material.dart';
import 'package:gesture_music_app/models/favorites_provider.dart';
import 'package:gesture_music_app/pages/favoritespage.dart';
import 'package:gesture_music_app/themes/theme_provider.dart';
import 'package:gesture_music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'pages/homepage.dart';

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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: const TabBarView(
            children: [
              HomePage(),
              FavoritesPage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .secondary,
            ),
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                  ),
                  text: "Home",
                ),
                Tab(icon: Icon(Icons.favorite), text: "Favorites"),
              ],
            ),
          ),
        ),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
