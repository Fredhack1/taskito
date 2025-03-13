import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';
import 'package:taskito/models/task_category.dart';
import 'package:taskito/view/components/task_tile.dart';
import 'package:taskito/models/task.dart';

class TasksListPage extends StatelessWidget {
  const TasksListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments passés lors de la navigation
    final Map arguments = Get.arguments;
    final String pageTitle = arguments['pageTitle'] ?? "No Title";
    // final List<Task> tasks = List<Task>.from(arguments['tasks'] ?? []);
    TaskController taskController = Get.put(TaskController());
    // Récupérer les tâches en fonction du board sélectionné
    List<Task> tasks = taskController.tasksDatabase
        .getTaskByCategory(TaskCategory(name: pageTitle));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 25.0,
            ),
            color: Colors.transparent,
            height: 140.0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  pageTitle,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 140.0,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: tasks.isEmpty
                ? Center(
                    child: Text(
                    'No tasks available for $pageTitle',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ))
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 0.0),
                    shrinkWrap: false,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskTile(
                        title: task.name,
                        description: task.description,
                        status: task.status,
                        onTap: () {
                          Get.toNamed(
                            '/show-task-details',
                            arguments: {
                              'pageTitle': 'Details',
                              'taskId': task.id,
                            },
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
