import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';
import 'package:taskito/models/task.dart';

class ShowTaskDetailPage extends StatelessWidget {
  const ShowTaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments passés lors de la navigation
    final Map arguments = Get.arguments;
    final String pageTitle = arguments['pageTitle'] ?? "No Title";
    final int taskId = arguments['taskId'] ?? "";
    TaskController taskController = Get.put(TaskController());
    Task task = taskController.tasksDatabase.getTaskById(taskId);
    // final String taskStatus = arguments['taskStatus'] ?? "";

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
            child: Column(
              children: [
                Text(
                  task.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  task.description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
