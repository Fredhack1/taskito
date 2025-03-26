import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskito/models/todo.dart';
import 'package:taskito/models/todo_repository.dart';

class TodoController extends GetxController {
  /** S I M U L A T I O N  D E  C A S E  A  C O C H E R */

  var isChecked = false.obs;

  /** F I N D E  S I M U L A T I O N */
  var todoTextController = TextEditingController();
  // Instantiation du dépôt Todo
  final TodoRepo todoRepo;

  // Liste des Todos, observables
  var todos = <Todo>[].obs;

  // Constructeur
  TodoController(this.todoRepo);

  // L O A D
  Future<void> loadTodos() async {
    // Récupérer la liste des todos à partir du dépôt
    final todoList = await todoRepo.getTodo();

    // Mettre à jour la liste des todos
    todos.assignAll(todoList);
  }

  // A D D
  Future<void> addTodo(String text) async {
    // Créer une nouvelle tâche
    final newTodo = Todo(
      id: DateTime.now().microsecondsSinceEpoch,
      text: text,
    );

    // Sauvegarder la nouvelle tâche dans le dépôt
    await todoRepo.addTodo(newTodo);

    // Recharger la liste des todos
    loadTodos();
  }

  // D E L E T E
  Future<void> deleteTodo(Todo todo) async {
    // Supprimer la tâche du dépôt
    await todoRepo.deleteTodo(todo);

    // Recharger la liste des todos
    loadTodos();
  }

  // T O G G L E
  Future<void> toggleCompletion(Todo todo) async {
    // Changer le statut de complétion de la tâche
    final updatedTodo = todo.toggleCompletion();

    // Mettre à jour la tâche dans le dépôt
    await todoRepo.updateTodo(updatedTodo);

    // Recharger la liste des todos
    loadTodos();
  }
}
