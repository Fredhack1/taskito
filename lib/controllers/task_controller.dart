import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taskito/models/task.dart';
import 'package:taskito/models/task_category.dart';
import 'package:taskito/models/task_categories_database.dart';
import 'package:taskito/models/tasks_database.dart';

enum TaskStatus { todo, inProgress, done }

final Map<TaskStatus, String> statusLabel = {
  TaskStatus.todo: 'À faire',
  TaskStatus.inProgress: 'En cours',
  TaskStatus.done: 'Terminé'
};

class TaskController extends GetxController {
  TasksDatabase tasksDatabase = TasksDatabase();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var selectedStatus = TaskStatus.todo.obs;
  var statues =
      <TaskStatus>[TaskStatus.todo, TaskStatus.inProgress, TaskStatus.done].obs;
  var categories = <TaskCategory>[].obs;
  var selectedCategory = Rxn<TaskCategory>();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  // Fonction de chargement des catégories de tâches
  void loadCategories() {
    categories.assignAll(TaskCategoriesDatabase().taskCategories);
    if (categories.isNotEmpty) {
      selectedCategory.value = categories.first;
    }
  }

  // Fonction d'ajout de catégories de tâches
  void addTask(title, description, status, category, startDate, endDate) {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      // Ajouter la logique d'ajout de tâche ici
      tasksDatabase.tasks.add(
        Task(
          id: tasksDatabase.tasks.length + 1,
          name: title,
          description: description,
          status: statusLabel[status]!,
          category: category,
          startDate: startDate,
          endDate: endDate,
        ),
      );
      TaskCategory taskCategory = category;
      List<Task> tasks = TasksDatabase().getTaskByCategory(taskCategory);
      Get.offNamed(
        '/tasks-list',
        arguments: {
          'pageTitle': taskCategory.name,
          'tasks': tasks,
        },
      );
      Get.snackbar(
        "Succès",
        "Tâche ajoutée avec succès !",
        duration: const Duration(seconds: 5),
      );

      // Réinitialiser le formulaire après l'ajout
      titleController.clear();
      descriptionController.clear();
      selectedStatus.value = TaskStatus.todo;
      update();
    } else {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir tous les champs",
        duration: const Duration(seconds: 5),
      );
    }
  }

  // Fonction de suppression de tâche
  void deleteTask(int taskId) {
    tasksDatabase.tasks.removeWhere((element) => element.id == taskId);
    Get.back();
    update();
  }
}
