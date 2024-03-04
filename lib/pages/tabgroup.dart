import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gesture_music_app/components/drawer.dart';
import 'package:gesture_music_app/components/miniplayer.dart';
import 'package:gesture_music_app/pages/songspage.dart';
import 'package:gesture_music_app/pages/favoritespage.dart';

class TabGroup extends StatelessWidget {
  const TabGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("P L A Y E R"),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "S O N G S",
                  ),
                  Tab(
                    text: "F A V O R I T E S",
                  ),
                ],
              ),
            ),
            drawer: const AppDrawer(),
            body: const TabBarView(
              children: [
                SongList(),
                FavoritesPage(),
              ],
            ),
          ),
          const Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: MiniPlayer(),
            ),
          ),
        ],
      ),
    );
  }
}
