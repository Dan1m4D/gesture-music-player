import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/drawer.dart';
import 'package:gesture_music_app/components/songlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M Y  S O N G S"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      drawer: const AppDrawer(),
      body: const Column(
        children: [
          SizedBox(height: 20.0),
          Expanded(
            child: SongList(),
          ),
        ],
      ),
    );
  }
}
