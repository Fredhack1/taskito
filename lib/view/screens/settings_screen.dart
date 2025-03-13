import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/themes/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeProvider _themeProvider = Get.find();
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // dark mode
                  Obx(() {
                    return Text(
                      _themeProvider.isDarkMode.value
                          ? "Light Mode"
                          : "Dark mode",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                  }),

                  // switch
                  CupertinoSwitch(
                    value: _themeProvider.isDarkMode.value,
                    onChanged: (bool value) => _themeProvider.toggleMode(),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
