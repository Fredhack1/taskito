import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/models/task.dart';
import 'package:taskito/models/tasks_database.dart';
import 'package:taskito/view/components/task_tile.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TasksDatabase tasksDatabase = TasksDatabase();
    List<Task> tasks = tasksDatabase.getTaskByStatus('Terminé');

    return Column(
      children: [
        Center(
          child: Text(
            'Done Tasks',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        // Tiles squares in a grid view having 2 tiles in a row
        Expanded(
          child: tasks.isEmpty
              ? Center(
                  child: Text(
                  'You don\'t have any completed tasks yet',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ))
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 15.0),
                  shrinkWrap: false,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskTile(
                        title: task.name,
                        description: task.description,
                        status: task.status,
                        startDate:
                            '${task.startDate?.year ?? DateTime.now().year}-${task.startDate?.month.toString().padLeft(2, '0') ?? '01'}-${task.startDate?.day.toString().padLeft(2, '0') ?? '01'}',
                        endDate:
                            '${task.endDate?.year ?? '2025'}-${task.endDate?.month.toString().padLeft(2, '0') ?? '01'}-${task.endDate?.day.toString().padLeft(2, '0') ?? '01'}',
                        onTap: () {
                          Get.toNamed(
                            '/task-details',
                            arguments: {
                              'pageTitle': 'Details',
                              'taskId': task.id,
                            },
                          );
                        });
                  },
                ),
        ),
      ],
    );
  }
}
