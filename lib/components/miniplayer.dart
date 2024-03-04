import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Row(
        children: [
          const Icon(Icons.play_arrow),
          const Text('Song Title'),
          const Text('Artist'),
        ],
      ),
    );
  }
}
