import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DueDateShowerComponent extends StatelessWidget {
  final String startDate;
  final String endDate;
  const DueDateShowerComponent({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              CupertinoIcons.hourglass_tophalf_fill,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Start Date:".toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  startDate,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              CupertinoIcons.hourglass_bottomhalf_fill,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "End Date:".toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  endDate,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
