import 'package:flutter/material.dart';
import 'package:taskito/controllers/todo_controller.dart';
import 'package:get/get.dart';
import 'package:taskito/models/todo_repository.dart';

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
