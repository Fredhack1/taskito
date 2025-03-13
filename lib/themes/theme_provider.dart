import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskito/themes/dark_mode.dart';
import 'package:taskito/themes/light_mode.dart';

class ThemeProvider extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Charger le thème sauvegardé au démarrage de l'application
    _loadThemePreference();
  }

  // Méthode pour charger la préférence du thème depuis SharedPreferences
  Future<void> _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? darkMode = prefs.getBool('isDarkMode');

    // Si la préférence n'est pas trouvée, définir le mode clair par défaut
    isDarkMode.value = darkMode ?? false;
  }

  // Méthode pour sauvegarder la préférence du thème depuis SharedPreferences
  Future<void> _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  void toggleMode() async {
    isDarkMode.value = !isDarkMode.value;

    // Sauvegarder la nouvelle préférence dans SharedPreferences
    await _saveThemePreference(isDarkMode.value);
  }

  // Méthode pour récupérer le thème actuel en fonction de l'état
  ThemeData get currentTheme {
    return isDarkMode.value ? darkMode : lightMode;
  }
}
