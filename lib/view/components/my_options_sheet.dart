import 'package:flutter/material.dart';

class MyOptionsSheet extends StatelessWidget {
  // final VoidCallback onViewPhoto;
  // final VoidCallback onChangePhoto;

  const MyOptionsSheet({
    super.key,
    // required this.onViewPhoto,
    // required this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.visibility,
                  color: Theme.of(context).colorScheme.secondary),
              title: Text(
                'Voir la photo de profil',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onTap: () {
                Navigator.pop(context);
                // onViewPhoto();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera,
                  color: Theme.of(context).colorScheme.secondary),
              title: Text(
                'Modifier la photo de profil',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              onTap: () {
                Navigator.pop(context);
                // onChangePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }
}
