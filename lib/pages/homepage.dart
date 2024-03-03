import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/drawer.dart';
import 'package:gesture_music_app/components/songlist.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("P L A Y L I S T"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const AppDrawer(),
        body: Column(
          children: [
            Text("Playlist", style: Theme.of(context).textTheme.headlineSmall),
            const Expanded(
              child: SongList(),
            ),
          ],
        ));
  }
}
