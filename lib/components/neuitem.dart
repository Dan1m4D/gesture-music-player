import 'package:flutter/material.dart';
import 'package:gesture_music_app/components/neubox.dart';

class NeuListItem extends StatelessWidget {
  final Widget? child;

  const NeuListItem({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: NeuBox(
        child: child,
      ),
    );
  }
}
