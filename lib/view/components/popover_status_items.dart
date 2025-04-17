import 'package:flutter/material.dart';

class PopoverStatusItems extends StatelessWidget {
  const PopoverStatusItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // à faire
        Container(
          height: 50,
          color: Theme.of(context).colorScheme.background,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 50,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 20),
              Text(
                'À faire',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // En cours
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 1,
              ),
              top: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 50,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              const SizedBox(width: 20),
              Text(
                'En cours',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Terminé
        Container(
          height: 50,
          color: Theme.of(context).colorScheme.background,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 50,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 20),
              Text(
                'Terminé',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
