import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/neubox.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(25)
      ),
      height: 80,
      child: const NeuBox(
        child:  Row(
          children: [
            Icon(Icons.play_arrow),
            
          ],
        ),
      ),
    );
  }
}
