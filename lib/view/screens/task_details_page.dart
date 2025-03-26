import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/controllers/task_controller.dart';
import 'package:taskito/controllers/todo_controller.dart';
import 'package:taskito/models/task.dart';
import 'package:taskito/models/todo_repository.dart';
import 'package:taskito/view/components/custom_textfield.dart';
import 'package:taskito/view/components/due_date_shower_component.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  void _showAddTodoBox(BuildContext context) {
    final TodoController todoController =
        Get.put(TodoController(Get.find<TodoRepo>()));
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          // add button
          TextButton(
            onPressed: () {
              todoController.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer les arguments passés lors de la navigation
    final Map arguments = Get.arguments;
    final String pageTitle = arguments['pageTitle'] ?? "No Title";
    final int taskId = arguments['taskId'] ?? -1;
    TaskController taskController = Get.put(TaskController());
    Task task = taskController.tasksDatabase.getTaskById(taskId);
    final TodoController todoController =
        Get.put(TodoController(Get.find<TodoRepo>()));
    // final String taskStatus = arguments['taskStatus'] ?? "";

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 25.0,
              ),
              color: Colors.transparent,
              height: 140.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(
                            '/add-or-edit-task',
                            arguments: {
                              'task-id': task.id,
                            },
                          );
                        },
                        icon: const Icon(CupertinoIcons.pencil),
                      ),
                      IconButton(
                        onPressed: () => taskController.deleteTask(task.id),
                        icon: const Icon(CupertinoIcons.trash),
                      ),
                    ],
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
              // Mon body column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        task.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        task.description,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      DueDateShowerComponent(
                        startDate:
                            '${task.startDate?.year ?? DateTime.now().year}-${task.startDate?.month.toString().padLeft(2, '0') ?? '01'}-${task.startDate?.day.toString().padLeft(2, '0') ?? '01'}',
                        endDate:
                            '${task.endDate?.year ?? DateTime.now().year}-${task.endDate?.month.toString().padLeft(2, '0') ?? '01'}-${task.endDate?.day.toString().padLeft(2, '0') ?? '01'}',
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtask",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              InkWell(
                                onTap: () => _showAddTodoBox(context),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(
                                            0.1), // Couleur de fond du bouton
                                    borderRadius: BorderRadius.circular(
                                        8), // Bordures arrondies
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              )
                            ],
                          ),
                          // const SizedBox(height: 10),
                          // Obx(() {
                          //   if (todoController.todos.isEmpty) {
                          //     return const Text("No subtasks available");
                          //   } else {
                          //     return ListView.builder(
                          //       itemCount: todoController.todos.length,
                          //       itemBuilder: (context, index) {
                          //         final todo = todoController.todos[index];
                          //         return ListTile(
                          //           title: Text(todo.text),
                          //           trailing: IconButton(
                          //             icon: Icon(todo.isCompleted
                          //                 ? Icons.check
                          //                 : Icons.close),
                          //             onPressed: () {
                          //               todoController.toggleCompletion(todo);
                          //             },
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   }
                          // }),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                // Checkbox
                                Obx(() {
                                  return Checkbox(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      value: todoController.isChecked.value,
                                      onChanged: (bool? value) {
                                        todoController.isChecked.value =
                                            value ?? false;
                                      });
                                }),
                                // Subtasks list
                                Text(
                                  "Create the add subtasks logic",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                // Checkbox
                                Obx(() {
                                  return Checkbox(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      value: todoController.isChecked.value,
                                      onChanged: (bool? value) {
                                        todoController.isChecked.value =
                                            value ?? false;
                                      });
                                }),
                                // Subtasks list
                                Text(
                                  "Create the add subtasks logic",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomTextField(
                    controller: todoController.todoTextController,
                    hintText: 'Add some subtasks here...',
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the subtask\'s text';
                      }
                      return null;
                    },
                    inputType: TextInputType.text,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
