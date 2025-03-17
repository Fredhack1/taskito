import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskito/models/task_categories_database.dart';
import 'package:taskito/models/task_category.dart';

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
  TaskCategoriesDatabase taskCategoriesDatabase = TaskCategoriesDatabase();
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
  void addBoard(String boardName, Category categoryType) {
    if (boardName.isNotEmpty) {
      // Ajouter la logique d'ajout de tableau ici
      taskCategoriesDatabase.taskCategories.add(
        TaskCategory(
          name: boardName,
          type: categoriesLabel[categoryType]!,
          icon: getIcon(categoryType),
        ),
      );

      taskCategoriesDatabase.taskCategories.sort((a, b) {
        return a.isSterile ? 1 : 0 - (b.isSterile ? 1 : 0);
      });

      boardNameController.clear();
      Get.offNamed('/home');
      Get.snackbar(
        "Succès",
        "Catégorie créée avec succès !",
        duration: const Duration(seconds: 5),
      );
    }
  }

  // Définir l'icône en fonction de la catégorie sélectionnée
  IconData getIcon(Category category) {
    switch (category) {
      case Category.personal:
        return CupertinoIcons.person;
      case Category.work:
        return CupertinoIcons.briefcase;
      case Category.private:
        return CupertinoIcons.lock;
      case Category.meeting:
        return CupertinoIcons.person_2;
      case Category.events:
        return CupertinoIcons.calendar;
      case Category.scheduler:
        return CupertinoIcons.add_circled;
      case Category.team:
        return CupertinoIcons.group;
    }
  }

  // Réinitialiser le formulaire après l'ajout
  void resetForm() {
    boardNameController.clear();
    selectedCategory.value = Category.personal;
  }
}
