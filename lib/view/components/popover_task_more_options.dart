import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopoverTaskMoreOptions extends StatelessWidget {
  final Function()? onTapOnEditBtn;
  const PopoverTaskMoreOptions({super.key, required this.onTapOnEditBtn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Edit
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).colorScheme.background,
          child: GestureDetector(
            onTap: onTapOnEditBtn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modifier',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  CupertinoIcons.pencil,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ),

        // Delete
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Supprimer',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                CupertinoIcons.delete,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
        ),

        // Archive
        // Container(
        //   height: 50,
        //   color: Theme.of(context).colorScheme.background,
        //   child: Row(
        //     children: [
        //       Text(
        //         'Archiver',
        //         style: TextStyle(
        //           color: Theme.of(context).colorScheme.secondary,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //       Icon(
        //         Icons.archive,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
