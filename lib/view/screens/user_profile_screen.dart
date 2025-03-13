import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "USER PROFILE",
        style: TextStyle(
          fontSize: 30,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
