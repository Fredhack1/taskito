import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';
import 'package:taskito/models/task_category.dart';
import 'package:taskito/models/task_categories_database.dart';
import 'package:taskito/view/components/board_tile.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Injection des Controllers
    TaskCategoriesDatabase taskCategoriesDatabase = TaskCategoriesDatabase();
    TaskController taskController = Get.put(TaskController());

    // Liste des icônes correspondantes
    final icons = [
      CupertinoIcons.person,
      CupertinoIcons.briefcase,
      CupertinoIcons.lock,
      CupertinoIcons.person_2,
      CupertinoIcons.calendar,
      CupertinoIcons.add_circled
    ];

    // Liste des couleurs
    final colors = [
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.onSecondary,
      Theme.of(context).colorScheme.onPrimary
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Board',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // filter icon button
            IconButton(
              onPressed: null,
              icon: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ],
        ),
        // Tiles squares in a grid view having 2 tiles in a row
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: taskCategoriesDatabase.taskCategories.length,
            itemBuilder: (context, index) {
              // J'utilise le modulo pour répartir les couleurs cycliquement
              Color tileColor = colors[index % colors.length];

              // Récupération de la catégorie du board en fonction de l'index
              TaskCategory taskCategory =
                  taskCategoriesDatabase.taskCategories[index];

              return BoardTile(
                title: taskCategory.name,
                tasksCount: taskController.tasksDatabase
                    .getTaskByCategory(taskCategory)
                    .length,
                icon: icons[index],
                color: tileColor,
                onTap: () {
                  if (taskCategory.isSterile == true) {
                    Get.toNamed('/create-board');
                  } else {
                    Get.toNamed(
                      '/tasks-list',
                      arguments: {
                        'pageTitle': taskCategory.name,
                      },
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
