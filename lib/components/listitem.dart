import 'package:flutter/material.dart';

class ListItemCard extends StatelessWidget {
  final Widget? child;

  const ListItemCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.brightness == Brightness.dark
                ? Colors.black
                : Colors.grey.shade500,
            offset: const Offset(5, 5),
            blurRadius: 15,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.brightness == Brightness.dark
                ? const Color.fromARGB(255, 48, 48, 48)
                : Colors.white,
            offset: const Offset(-5, -5),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: child,
      ),
    );
  }
}
