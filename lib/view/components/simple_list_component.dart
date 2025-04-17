import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleListComponent extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onTap;
  const SimpleListComponent({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // label
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: label != "Logout"
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),

            // icon
            Icon(
              icon,
              color: label != "Logout"
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
