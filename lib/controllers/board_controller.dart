import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Category { personal, work, private, meeting, events, scheduler, team }

final Map categoriesLabel = {
  Category.personal: 'Personnel',
  Category.work: 'Travail',
  Category.private: 'Privé',
  Category.meeting: 'Réunion',
  Category.events: 'Événements',
  Category.scheduler: 'Planification',
  Category.team: 'En Équipe'
};

class BoardController extends GetxController {
  var boardNameController = TextEditingController();
  var selectedCategory = Category.personal.obs;
  var categories = <Category>[
    Category.personal,
    Category.work,
    Category.private,
    Category.meeting,
    Category.events,
    Category.scheduler,
    Category.team,
  ].obs;

  // Fonction d'ajout d'un tableau
  void addBoard(boardName, category) {
    if (boardNameController.text.isNotEmpty) {
      // Ajouter la logique d'ajout de tableau ici
      Get.offNamed('/home');
      Get.snackbar(
        "Succès",
        "Catégorie créée avec succès !",
        duration: const Duration(seconds: 5),
      );
    }
  }

  // Réinitialiser le formulaire après l'ajout
  void resetForm() {
    boardNameController.clear();
    selectedCategory.value = Category.personal;
  }
}
